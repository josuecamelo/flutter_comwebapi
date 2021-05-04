import 'package:bytebankbd/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'bytebank.db');
  //   return openDatabase(path, onCreate: (db, version) {
  //     db.execute('CREATE TABLE contacts('
  //         'id INTEGER PRIMARY KEY, '
  //         'name TEXT, '
  //         'account_number INTEGER)');
  //   }, version: 1,
  //  // onDowngrade: onDatabaseDowngradeDelete,
  //   );
  // });

  //com async await
  //final String dbPath = await getDatabasesPath();
  //final String path = join(dbPath, 'bytebank.db');
  //ou

  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(path, onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    }, version: 1,
      // onDowngrade: onDatabaseDowngradeDelete, //avança versão + 1 depois volta menos 1 dai ele deleta
    );
}
