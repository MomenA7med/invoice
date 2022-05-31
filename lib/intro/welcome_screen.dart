import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice/auth/login/login_screen.dart';
import 'package:invoice/auth/sign_up/sign_up_screen.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/views/company_create_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.SPLASH_BACKGROUND),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.LOGO),
              SizedBox(height: 50,),
              Text('In publishing and graphic design, Lorem is a placeholder text commonly ',
              style: TextStyle(
                height: 1.20.h,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400
              ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h,),
              InkWell(
                onTap: (){
                  AppNavigator.pushTo(context: context, widget: SignUpScreen());
                },
                child: Container(
                  width: 256.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: Color(0xff002D84),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(Languages.of(context)!.kCreateAccount,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  AppNavigator.pushTo(context: context, widget: LoginScreen());
                },
                child: Container(
                  width: 256.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F7FE),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(Languages.of(context)!.kLogin,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff31CB47),
                      ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}