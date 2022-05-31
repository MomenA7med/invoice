import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/auth/login/reset_your_password.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/views/widgets/widgets.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({ Key? key }) : super(key: key);

  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xff002D84),
                    ),
                  ),
                ),
                SizedBox(height: 100.h,),
                Text('Password Recovery',style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                ),),
                SizedBox(height: 10.h,),
                Text('Enter your E-mail to recover your password',
                  textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffA2A0A8),
                  ),),
                SizedBox(height: 30.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                  child: inputField(hint: 'Email', asset: Assets.EMAIL),
                ),
                SizedBox(height: 30.h,),
                appButton(text: Languages.of(context)!.kContinue, onTab: (){
                  AppNavigator.pushTo(context: context, widget: ResetYourPassword());
                }),
                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}