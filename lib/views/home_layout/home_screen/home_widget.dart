import 'package:flutter/material.dart';

Widget buildHomeItem(){
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('إجمالى الفواتير ',style: TextStyle(
                fontSize: 20,
              ),),
              SizedBox(width: 10,),
              Icon(Icons.calendar_today,color: Colors.blueAccent,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('22222 ',style: TextStyle(
                fontSize: 20,
              ),),
              Text('ريــــال',style: TextStyle(
                fontSize: 20,
              ),),
            ],
          ),
          SizedBox(height: 10,),

        ],
      ),
    ),
  );
}