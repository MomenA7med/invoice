import 'package:flutter/material.dart';
import 'package:invoice/auth/login/login_screen.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/views/company_create_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Text('Logo'),
            ),
            SizedBox(height: 10,),
            Text('Slogan'),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                AppNavigator.pushTo(context: context, widget: CompantCreateScreen());
              },
              child: Text(Languages.of(context)!.kStartNow),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Languages.of(context)!.kHaveAccount),
                TextButton(onPressed: (){
                  AppNavigator.pushTo(context: context, widget: LoginScreen());
                }, child: Text(Languages.of(context)!.kLogin)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}