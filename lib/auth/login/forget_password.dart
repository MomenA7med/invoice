import 'package:flutter/material.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({ Key? key }) : super(key: key);

  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          )
        ), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Text(Languages.of(context)!.kForgetPass,style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20,),
            defaultTextField(controller: emailController, text: Languages.of(context)!.kCompanyEmail),
            SizedBox(height: 20,),
            defaultButon(text: Languages.of(context)!.kRestorePass, function: (){}),
          ],
        ),
      ),
    );
  }
}