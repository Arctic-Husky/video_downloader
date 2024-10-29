abstract class IClientHttp {
  Future<Map<String, dynamic>> get(
    String path, {
    required String baseUrl,
    Map<String, dynamic>? queryParameters,
    Object? data,
  });

  // Future<void> download(
  //   String path, {
  //   required String fileName,
  //   required String baseUrl,
  //   Map<String, dynamic>? queryParameters,
  //   Object? data,
  // });
}
