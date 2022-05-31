import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/intro/slide_dots.dart';
import 'package:invoice/intro/slider_item.dart';
import 'package:invoice/intro/welcome_screen.dart';
import 'package:invoice/utils/Navigator.dart';



class OnBoardingScreen extends StatefulWidget{

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;
  List<String> heades = [
    'Welcome to InPaid',
    'Invoice'
  ];
  List<String> titles = [
    'Managing your Business is about to get a lot better.',
    'Invoice smarter every day, all from one app.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.SPLASH_BACKGROUND),
              fit: BoxFit.cover,
            )
        ),
        child: SafeArea(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 500.h,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: (index){
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemCount: titles.length,
                      itemBuilder: (ctx, i) => SliderItem(header: heades[i], title: titles[i], index: i),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    child: _buildLandingPageControlButtons(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  Widget _buildLandingPageControlButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < titles.length; i++)
                    if (i == _currentIndex) SlideDots(true) else SlideDots(false)
                ],
              ),
        ),
        SizedBox(height: 80.h,),
        Padding(
          padding:  EdgeInsets.only(right: 20.0.w),
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    if(_currentIndex == 0){
                      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                    }else{
                      AppNavigator.pushTo(context: context, widget: WelcomeScreen());
                    }
                  },
                  child: Container(
                    width: 145.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xff002D84),
                    ),
                    child: Center(
                      child: Text('Next',style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                  ),
                ),
                SizedBox(width: 20.w,),
                InkWell(
                  onTap: (){
                    AppNavigator.pushTo(context: context, widget: WelcomeScreen());
                  },
                  child: Container(
                    width: 62.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xffF9F9FA),
                    ),
                    child: Center(
                      child: Text('Skip',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}