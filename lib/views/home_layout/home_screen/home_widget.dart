import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildHomeItem(){
  return ListTile(
    contentPadding: EdgeInsets.all(0.0),
    leading: CircleAvatar(
      radius: 40.r,
      backgroundImage: NetworkImage('https://i.pinimg.com/originals/58/40/fe/5840feccd6c0b9fee9918e13c0a48225.png'),
    ),
    title: Text('Apple'),
    subtitle: Text('iPhone 12'),
    trailing: Text('\$120,90'),
  );
}