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

  // Store this constant value in secure place that wont be accidentally changed
  static const String baseUrl = 'https://stable-api.pricelocq.com';
  static const String loginSessionUrl = '$baseUrl/mobile/v2/sessions';
  static const String allStationsUrl = '$baseUrl/mobile/stations?all';

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
