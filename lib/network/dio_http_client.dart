import 'package:dio/dio.dart';

class DioHttpClient {
  final String baseUrl;

  const DioHttpClient({required this.baseUrl});

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );

    Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor());

    return dio;
  }
}
