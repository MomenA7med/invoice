import 'package:flutter/material.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/utils/Navigator.dart';

class SearchScreen extends StatelessWidget {
 SearchScreen({ Key? key }) : super(key: key);

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          )
        ),
        title: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: defaultTextField(controller: searchController, text: 'بحث',search: true),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
              AppNavigator.pushTo(context: context, widget: SearchScreen());
            }, icon: Icon(Icons.search),iconSize: 30,alignment: Alignment.center,),
          ),
        ], 
      ),
      
    );
  }
}