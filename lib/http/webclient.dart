
import 'package:bytebankbd/http/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(interceptors: [
  LoggingInterceptor(),
]);

const String baseUrl = 'http://192.168.0.7:8080/transactions';

