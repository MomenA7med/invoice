import 'package:flutter/material.dart';

Widget defaultTextField({required TextEditingController controller,required text,bool search = false}) => TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: search ? Colors.white : null,
          filled: search,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.indigo),
          ),
          labelText: text,
        ),
    );

Widget defaultButon({required String text,required VoidCallback function,width = double.infinity}) => Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
        ),
        child: ElevatedButton(onPressed: function,
         child: Text(text),));