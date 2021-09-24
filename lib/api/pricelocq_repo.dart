import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pricelocq_temp/model/credential.dart';

final priceLocqApi = Provider<PriceLocqApi>((ref) => IPriceLocqApi());

abstract class PriceLocqApi {
  Future<void> login({required Credential credential});
}

class IPriceLocqApi implements PriceLocqApi {
  static final Dio _dio = Dio();

  // Store this constant value in secure place that wont accidentally changed 
  static const String loginSessionUrl =
      'https://stable-api.pricelocq.com/mobile/v2/sessions';

  @override
  Future<String> login({required Credential credential}) async {
    try {
      Response _response = await _dio.post(
        loginSessionUrl,
        options: Options(contentType: "application/json"),
        data: credential.toMap(),
      );
      debugPrint("Response: ${_response.data['data']}");

      // Since the statucCode is always 200 error or not, Im using the response body 'status'
      if (_response.data['status'] == 'success') {
        return _response.data['data']['accessToken'].toString();
      } else {
        // I just directly passed the error message
        // For clean code can create an ErrorHandler Class
        throw "${_response.data['data']['code']}: ${_response.data['data']['message']}";
      }
    } catch (e) {
      // debugPrint("$e");
      rethrow;
    }
  }
}
