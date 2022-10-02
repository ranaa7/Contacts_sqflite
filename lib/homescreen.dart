import 'package:contacts_sqflite/dbhelper.dart';
import 'package:flutter/material.dart';

class Sqf extends StatefulWidget {
  const Sqf({Key? key}) : super(key: key);

  @override
  State<Sqf> createState() => _SqfState();
}

class _SqfState extends State<Sqf> {
  Dbhelper dbhelper = Dbhelper();

  // var scaffoldkey=GlobalKey<ScaffoldState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: [
          IconButton(
              onPressed: () {
                dbhelper.getdata().then((value) {
                  print(value);
                });
              },
              icon: Icon(Icons.phone))
        ],
      ),
      body: FutureBuilder(
          future: dbhelper.getdata(),
          builder: (context, snapshot) {
            var data = snapshot.data;

            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Text(
                    ,
                    );
                  });
            } else {
              return Container();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text("Add"),
              content: Container(
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: ("Name"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          )),
                    ),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: ("Email"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          )),
                    ),
                    TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: ("Phone"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          )),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      dbhelper
                          .insertdata(
                              name: name.text,
                              email: email.text,
                              phone: phone.hashCode)
                          .then((value) {
                        print(value);
                        print("inserted");
                        Navigator.of(context).pop();
                        setState(() {});
                      });
                    },
                    child: Text("save"))
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
