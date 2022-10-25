import 'package:flutter/material.dart';
import 'package:task_3/results.dart';

import 'SQL_lite.dart';
import 'main.dart';
List<String> list = <String>['One', 'Two', 'Three', 'Four'];
List<int> numbers = <int> [1, 2, 3 , 4 , 5 , 6, 7];
List <bool> boolz = <bool> [true, false];

class MenuScreen extends StatefulWidget {

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
SqlDb sqlDb = SqlDb();
  String dropdownValue = list.first;
  int dropdownValue2 = numbers.first;
  bool dropdownValue3 = boolz.first;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
    title: Text('fuk u'),
    ),
     body: Center(
       child: Column(
         children: [
           Row(
             children: [
               DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? value){
                  setState(()  {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
    ),
               SizedBox(
                 width: 15,
               ),
               DropdownButton<int>(
                 value: dropdownValue2,
                 onChanged: (int? value2){
                   setState(() {
                     dropdownValue2= value2!;
                   });
                 },
                 items: <int>[1, 2, 3 , 4 , 5 , 6, 7].map<DropdownMenuItem<int>>((int value2) {
                   return  DropdownMenuItem<int>(
                     value: value2,
                     child:  Text ( value2.toString()) ,
                   );
                 }).toList(),
               ),
               SizedBox(
                 width: 15,
               ),
               DropdownButton<bool>(
                 value: dropdownValue3,
                 onChanged: (bool? value3){
                   setState(() {
                     dropdownValue3= value3!;
                   });
                 },
                 items: boolz.map<DropdownMenuItem<bool>>((bool value3) {
                   return DropdownMenuItem<bool>(
                     value: value3,
                     child:Text (value3.toString()) ,
                   );
                 }).toList(),
               ),
             ],
           ),
           TextButton(
             style: ButtonStyle(
               foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
             ),
             onPressed: () async{
               int response = await sqlDb.insertData('INSERT INTO notes (note, phonenumber, state) VALUES("$dropdownValue" , "$dropdownValue2" , "$dropdownValue3") ');
               print(response);
             },
             child: Text('insert data'),
           ),

        ElevatedButton(
            onPressed: ()async{
              response = await sqlDb.readData("SELECT * FROM 'notes' ");
              Navigator.push( context,
                MaterialPageRoute(
                  builder: (context) => Result(
                  ),
                ),);
            },
            child: Text('next page'),
        ),
         ],
       ),
     ),
    );
  }

}
