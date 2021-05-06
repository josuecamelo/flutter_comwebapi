import 'dart:convert';

import 'package:bytebankbd/models/contact.dart';
import 'package:bytebankbd/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(interceptors: [
  LoggingInterceptor(),
]);

const String baseUrl = 'http://192.168.0.7:8080/transactions';

Future<List<Transaction>> findAll() async {
  final Response response =
      await client.get(baseUrl).timeout(Duration(seconds: 5));

  //CONVERSÃO DA RESPOSTA - STRING JSON CONVERTER PARA OBJETO DO DART
  final List<dynamic> decodeJson = jsonDecode(response.body);
  final List<Transaction> transactions = List();
  for (Map<String, dynamic> transactionJson in decodeJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
        transactionJson['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ));
    transactions.add(transaction);
  }

  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value' : transaction.value,
    'contact' : {
      'name' : transaction.contact.name,
      'accountNumber' : transaction.contact.accountNumber
    }
  };
  final String transactionJson = jsonEncode(transactionMap);

  final Response response = await client.post(baseUrl, headers: {
    'Content-type': 'application/json',
    'password': '1000',
  }, body: transactionJson);

  Map<String, dynamic> json = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = json['contact'];
  return Transaction(
    json['value'],
    Contact(
      0,
      contactJson['name'],
      contactJson['accountNumber'],
    ),
  );
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
    /*print('RESPOSTA');
    print('URL: ${data.body}');
    print('STATUS CODE: ${data.statusCode}');*/
    return data;
  }
}
