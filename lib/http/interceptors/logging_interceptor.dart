import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    //print(data.toString());
    print('REQUISIÇÃO');
    print('URL: ${data.url}');
    print('HEADERS: ${data.headers}');
    print('BODY: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    //print(data.toString());
    /*print('RESPOSTA');
    print('URL: ${data.body}');
    print('STATUS CODE: ${data.statusCode}');*/
    return data;
  }
}
