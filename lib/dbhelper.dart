import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper{
  Database? database;

  // void createdata() async {
  //   database = await openDatabase('todo.db', version: 1,
  //       onCreate: (database, version) {
  //         print("database created");
  //         database
  //             .execute(
  //             'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, name TEXT, email TEXT, num REAL)')
  //             .then((value) {
  //           print("table created");
  //         }).catchError((error) {
  //           print('Error when creating table${error.toString()}');
  //         });
  //       }, onOpen: (database) {
  //         getdata(database).then((value) {
  //           setState(() {
  //             tasks = value;
  //             print(tasks);
  //           });
  //         });
  //         print("database opened");
  //       });
  //}
  Future open() async {
    String path = join(await getDatabasesPath(), 'tasks.db');

    database = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, name TEXT, email TEXT, num REAL)')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print('Error When Creating Table ${error.toString()}');
      });
    },
    );
  }

  Future insertdata(
      {required String name, required String email, required int phone}) async {
   await open();
    return await database!.
          rawInsert(
          "INSERT INTO tasks(name,email,num)VALUES( '$name','$email','$phone')")
          .then((value) {
        print("$value inserted succesfully");
      }).catchError((error) {
        print('Error when inserting${error.toString()}');
      });
      return null;
    }


  Future getdata() async {
    await open();
    return await database!.rawQuery('SELECT * FROM tasks');
  }

}