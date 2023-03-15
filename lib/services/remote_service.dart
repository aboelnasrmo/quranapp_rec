import 'package:dio/dio.dart';
import 'package:restapicourse/constants/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getReciters() async {
    try {
      final Response? response = await _dio.get('$baseUrl$recitersUrl');
      return response;
    } catch (e) {
      print(e);
    }
  }
}
