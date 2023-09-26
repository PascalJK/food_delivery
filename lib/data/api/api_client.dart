import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    // Set allow auto signed cert to [true] to avoid: HandshakeException
    allowAutoSignedCert = true;
    updateHeader(token);
  }

  void updateHeader(String token) => _mainHeaders = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      return await get(uri, headers: headers ?? _mainHeaders);
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      var response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
