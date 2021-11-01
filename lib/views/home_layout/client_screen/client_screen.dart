import 'package:flutter/material.dart';
import 'package:invoice/views/home_layout/client_screen/client_widget.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildItemClient('Selection Vally', 'شركة',context),
              SizedBox(height: 20,),
              buildItemClient('مؤمن أحمد', 'فردي',context),
            ],
          ),
        ),
      ),
    );
  }
}