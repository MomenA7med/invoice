import 'package:flutter/material.dart';
import 'package:invoice/auth/login/forget_password.dart';
import 'package:invoice/auth/sign_up/sign_up_screen.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/views/company_create_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({ Key? key }) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Languages.of(context)!.kWelcome,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
              ],
            ),
            SizedBox(height: 50,),
            defaultTextField(controller: emailController, text: Languages.of(context)!.kCompanyEmail),
            SizedBox(height: 10,),
            defaultTextField(controller: passwordController, text: Languages.of(context)!.kPassword),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                  AppNavigator.pushTo(context: context, widget: ForgetPasswordScreen());
                }, child: Text(Languages.of(context)!.kForgetPass)),
              ],
            ),
            SizedBox(height: 10,),
            defaultButon(text: Languages.of(context)!.kLogin, function: (){
              AppNavigator.pushTo(context: context, widget: CompantCreateScreen());
            }),
            SizedBox(height: 5,),
            TextButton(onPressed: (){
              AppNavigator.pushTo(context: context, widget: SignUpScreen());
            }, child: Text(Languages.of(context)!.kCreateAccount)),
          ],
        ),
      ),
    );
  }
}