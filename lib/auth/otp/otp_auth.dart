import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/views/home_layout/home_layout.dart';
import 'package:invoice/views/widgets/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class OtpAuthentication extends StatefulWidget {

  @override
  State<OtpAuthentication> createState() => _OtpAuthenticationState();
}

class _OtpAuthenticationState extends State<OtpAuthentication> {
  TextEditingController controller = TextEditingController(text: "");

  String thisText = "";
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
                SizedBox(height: 70.h,),
                Text('OTP Authentication',style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                ),),
                SizedBox(height: 10.h,),
                Text('An authentication code has been sent to Hossam@example.com',
                textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffA2A0A8),
                  ),),
                SizedBox(height: 30.h,),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    selectedFillColor: Color(0xffF9F9FA),
                    borderWidth: 2,
                    activeColor: Color(0xff002D84),
                    inactiveColor: Colors.grey[200],
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10.r),
                    fieldWidth: 66.w,
                    fieldHeight: 66.h,
                    activeFillColor: Color(0xffF9F9FA),
                    inactiveFillColor: Color(0xffF9F9FA),
                  ),
                  showCursor: false,
                  animationDuration: Duration(milliseconds: 300),
                  hintCharacter: '0',
                  controller: controller,
                  onCompleted: (v) {
                    print('value:'+thisText);
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      thisText = value;
                    });
                  },
                  appContext: context,
                ),
                SizedBox(height: 30.h,),
                appButton(text: Languages.of(context)!.kContinue, onTab: (){
                  AppNavigator.pushTo(context: context, widget: HomeLayout());
                }),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn\'t recieve otp?',style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff9CA3AF)
                    ),),
                    TextButton(onPressed: (){
                    }, child: Text('Resend',style: TextStyle(
                      fontSize: 16.sp,
                    ),)),
                  ],
                ),
                SizedBox(height: 10.h,),
                Text('Not You?',style: TextStyle(
                  color: Color(0xff002D84),
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
