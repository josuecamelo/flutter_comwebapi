import 'dart:convert';

import 'package:bytebankbd/http/webclient.dart';
import 'package:bytebankbd/models/contact.dart';
import 'package:bytebankbd/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient{
  Future<List<Transaction>> findAll() async {
    final Response response =
    await client.get(baseUrl).timeout(Duration(seconds: 5));

    final List<dynamic> decodeJson = jsonDecode(response.body);
    return decodeJson.map((dynamic json) => Transaction.fromJson(json)).toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUrl, headers: {
      'Content-type': 'application/json',
      'password': '1000',
    }, body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }
}