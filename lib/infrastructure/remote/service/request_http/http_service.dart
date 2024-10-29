import 'dart:io'; // pacote apenas para mobile

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:video_downloader/infrastructure/remote/service/request_http/client_http_interface.dart';

class HttpService implements IClientHttp {
  Dio dio = createDio(trustSelfSigned: true);

  // TODO: entender melhor como funciona o Dio e como funciona isso que o Andrey fez
  @override
  Future<Map<String, dynamic>> get(
    String path, {
    required String baseUrl,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (
          DioException error,
          ErrorInterceptorHandler handler,
        ) {
          handler.next(
            error,
          );
        },
      ),
    );
    try {
      var response = await dio.get(
        baseUrl + path,
        queryParameters: queryParameters,
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      return response.data;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          throw e.response!.data;
        } else {
          throw e.error.toString();
        }
      } else {
        rethrow;
      }
    }
  }
}

Dio createDio({String? baseUrl, bool trustSelfSigned = false}) {
  // Inicialize o Dio
  final dio = Dio();

  // Permita certificados autoassinados
  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient();

    client.badCertificateCallback = (cert, host, port) => true;

    return client;
  };

  return dio;
}
