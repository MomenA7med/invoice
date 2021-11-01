import 'package:flutter/material.dart';
import 'package:invoice/views/home_layout/home_screen/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              buildHomeItem(),
              SizedBox(height: 20,),
              buildHomeItem(),
              SizedBox(height: 20,),
              buildHomeItem(),
              SizedBox(height: 20,),
              buildHomeItem(),
            ],
          ),
        ),
      ),
    );
  }
}