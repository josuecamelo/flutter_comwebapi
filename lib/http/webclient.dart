import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

void findAll() async{
  final Client client = HttpClientWithInterceptor.build(interceptors: [
    LoggingInterceptor(),
  ]);

  final Response response = await client.get('http://192.168.0.7:8080/transactions');
}

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
    print('RESPOSTA');
    print('URL: ${data.body}');
    print('STATUS CODE: ${data.statusCode}');
    return data;
  }
}