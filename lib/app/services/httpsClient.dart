import 'package:dio/dio.dart';
import 'package:xmshop/app/models/focus_model.dart';

class HttpsClient {
  
  static String domain = 'https://miapp.itying.com/';

  static Dio dio  = Dio();

  HttpsClient() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 5);


  }

  Future get(apiUrl) async {
    try {
      var response = await dio.get(apiUrl);
      return response;
    }catch (e) {
      print('请求超时');
      return null;
    }
  }

  static replaceUri(picUrl)  {
    String tempUrl = domain + picUrl;
    return tempUrl.replaceAll('\\', '/');
  }

}
