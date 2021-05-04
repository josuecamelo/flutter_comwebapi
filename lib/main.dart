import 'package:bytebankbd/database/app_database.dart';
import 'package:bytebankbd/models/contact.dart';
import 'package:bytebankbd/screens/contact_form.dart';
import 'package:bytebankbd/screens/contacts_list.dart';
import 'package:bytebankbd/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BytebankApp());
  // const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  // Random _rnd = Random();
  //
  // String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
  //     length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  //
  // save(Contact(0, getRandomString(new Random().nextInt(50) + 10), 1001)).then((id){
  //   findAll().then((contacts) => debugPrint(contacts.toString()));
  // });
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
      ),
      home: Dashboard(),
    );
  }
}



