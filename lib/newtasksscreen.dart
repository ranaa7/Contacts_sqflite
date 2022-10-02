
import 'package:flutter/material.dart';

import 'constants.dart';

class Newtasks extends StatelessWidget {
   Newtasks({Key? key,required this.name1,required this.email1,required this.phone1}) : super(key: key);
  var name1 ;
  var email1 ;
  var phone1 ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: tasks.length,itemBuilder:(context,index)=>

            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                CircleAvatar(
                  backgroundColor: Colors.pinkAccent, radius: 40, child: Text("h"),),

                Column(children: [Text("$name1",style: TextStyle(fontSize: 40),), Text("$email1",style: TextStyle(fontSize: 40)), Text("$phone1",style: TextStyle(fontSize: 40))],),Icon(Icons.edit)
              ]),
            ),
          )

        );


  }
}
