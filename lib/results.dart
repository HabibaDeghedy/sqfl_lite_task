import 'package:flutter/material.dart';
import 'SQL_lite.dart';
import 'main.dart';
class Result extends StatefulWidget {
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Results',
        ),
      ),
      body: Column(
        children: [
           // FutureBuilder(
             // future:response ,
             // builder: (BuildContext context, AsyncSnapshot snapshot) {
                //if (snapshot.data){
                  Text(response [0]['note']),
                //}
                //else{
                    Text(
                    'awaiting results'
                  ),
                //}

             // }
    //),
          

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);

            },
            child: const Text('Go back!'),
          ),

        ],
      ),
    );
  }
}

