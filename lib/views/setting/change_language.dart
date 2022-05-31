import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/views/widgets/widgets.dart';

class ChangeLanguageScreen extends StatefulWidget{
  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  int choose = 0;
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
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xff002D84),
                        ),
                      ),
                      SizedBox(width: 126.w,),
                      Text('Language',style: TextStyle(
                        color: Color(0xff002D84),
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 180.h,),
                InkWell(
                  onTap: (){
                    setState(() {
                      choose = 0;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: Container(
                      height: 56.h,
                      //width: 311.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xffF9F9FA),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 8.w,),
                            Expanded(
                              child: Text('English (US)',style: TextStyle(
                                color: Color(0xff002D84),
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),),
                            ),
                            Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xff002D84),width: 2.w),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: 10.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: choose == 0 ? Color(0xff31CB47) : Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                InkWell(
                  onTap: (){
                    setState(() {
                      choose = 1;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: Container(
                      height: 56.h,
                      //width: 311.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xffF9F9FA),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 8.w,),
                            Expanded(
                              child: Text('العربية',style: TextStyle(
                                color: Color(0xff002D84),
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),),
                            ),
                            Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xff002D84),width: 2.w),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: 10.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: choose == 1 ? Color(0xff31CB47) : Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.h,),
                appButton(text: Languages.of(context)!.kSave, onTab: (){
                  //AppNavigator.pushTo(context: context, widget: HomeLayout());
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