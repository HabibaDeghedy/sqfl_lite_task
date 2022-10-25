import 'package:flutter/material.dart';
import 'package:task_3/menu.dart';
import 'package:sqflite/sqflite.dart';
import 'SQL_lite.dart';

late List<Map>response;
 SqlDb sqlDb = SqlDb();

void main()  {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MenuScreen(),
    );
  }



}

