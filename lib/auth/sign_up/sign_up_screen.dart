import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice/auth/login/login_screen.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({ Key? key }) : super(key: key);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Text(Languages.of(context)!.kRegister,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.blueGrey,
            ),),
            SizedBox(height: 20,),
            defaultTextField(controller: nameController, text: Languages.of(context)!.kName),
            SizedBox(height: 10,),
            defaultTextField(controller: emailController, text: Languages.of(context)!.kCompanyEmail),
            SizedBox(height: 10,),
            defaultTextField(controller: passwordController, text: Languages.of(context)!.kPassword),
            SizedBox(height: 20,),
            defaultButon(text: Languages.of(context)!.kRegister, function: (){}),
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