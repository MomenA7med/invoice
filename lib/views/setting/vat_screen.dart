import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/views/widgets/widgets.dart';

class VatScreen extends StatelessWidget{
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
                      Text('VAT',style: TextStyle(
                        color: Color(0xff002D84),
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 100.h,),
                Text('Amount of taxes owed by your customer will be added to each product and displayed at checkout',
                  textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffA2A0A8),
                  ),),
                SizedBox(height: 30.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                  child: inputField(hint: 'VAT', asset: Assets.VAT),
                ),
                SizedBox(height: 30.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                  child: inputFieldWithoutAsset(hint: 'Tax Registration Number(TRN)'),
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