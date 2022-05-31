import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice/constants/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/constants/singleton/UserSingleton.dart';
import 'package:invoice/intro/onboard_screen.dart';
import 'package:invoice/intro/welcome_screen.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/views/home_layout/home_layout.dart';


class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  final _splashDelay = 2;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: _splashDelay);
    return Timer(_duration, _navigationPage);
  }

  void _navigationPage() async {
    if(UserSingleton().token != null){
      AppNavigator.pushReplacement(
          context: context,
          widget:HomeLayout());
    }else{
      AppNavigator.pushReplacement(
          context: context,
          widget:OnBoardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.SPLASH_BACKGROUND),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.LOGO,
              width: 223.w,
              height: 67.h,
            ),
            SizedBox(height: 10,),
            Text('Everything you need to succeed in online sales',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: Color(0xff5F5F5F),
            ),)
          ],
        ),
      ),
    );
  }
}