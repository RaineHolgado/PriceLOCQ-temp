import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pricelocq_temp/model/credential.dart';
import 'package:pricelocq_temp/model/station.dart';

final priceLocqRepo = Provider<PriceLocqApi>((ref) => IPriceLocqApi());

abstract class PriceLocqApi {
  Future<String> fetchAccessToken({required Credential credential});
  Future<List<Station>> fetchAllStations({required String token});
}

class IPriceLocqApi implements PriceLocqApi {
  static final Dio _dio = Dio();

  // Store this constant value in secure place that wont accidentally changed
  static const String loginSessionUrl =
      'https://stable-api.pricelocq.com/mobile/v2/sessions';
  static const String allStationsUrl =
      'https://stable-api.pricelocq.com/mobile/stations?all';

  @override
  Future<String> fetchAccessToken({required Credential credential}) async {
    try {
      Response _response = await _dio.post(
        loginSessionUrl,
        options: Options(
          contentType: "application/json",
        ),
        data: credential.toMap(),
      );
      // debugPrint("Response: ${_response.data['data']}");

      // Since the statucCode is always 200 error or not, Im using the response body 'status'
      if (_response.data['status'] == 'success') {
        return _response.data['data']['accessToken'].toString();
      } else {
        // I just directly passed the error message
        // For clean code can create an ErrorHandler Class
        throw "${_response.data['data']['code']}: ${_response.data['data']['message']}";
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Station>> fetchAllStations({required String token}) async {
    try {
      _dio.options.headers['Authorization'] = token;
      // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiYWNjZXNzIiwidXNlcklkIjoxNDM0NywibW9iaWxlQ29uZmlybWVkIjp0cnVlLCJpYXQiOjE2MzI0NzA2ODUsImV4cCI6MTYzMjQ3Nzg4NX0.wvdvW-jI2l2jsTRRRALW5cEkpay9xPQjnf5k2Nmu88M';
      Response _response = await _dio.get(
        allStationsUrl,
        options: Options(
          contentType: "application/json",
        ),
      );

      if (_response.data['status'] == 'success') {
        if (_response.data['data'].length != 0) {
          // There's some kind of runtime error here that is needs to specify the type, so i did it manually not good practice hihihi :)
          List<dynamic> _data = _response.data['data'] as List<dynamic>;

          return _data.map((result) => Station.fromMap(result)).toList();
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
