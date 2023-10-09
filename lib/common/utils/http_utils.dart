import 'package:dio/dio.dart';
import 'package:learning_app/common/values/constant.dart';

class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstant.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 5 * 6000),
        receiveTimeout: const Duration(seconds: 5 * 6000),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameter}) async {
    var response =
        await dio.post(path, data: data, queryParameters: queryParameter);
    print('my response data is ${response.toString()}');
    print('my status is ${response.statusCode.toString()}');
    return response.data;
  }
}
