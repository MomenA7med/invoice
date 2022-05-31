import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice/constants/assets.dart';

class SliderItem extends StatelessWidget{
  final String header,title;
  final int index;
  SliderItem({required this.header,required this.title,required this.index,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
      child: Container(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(header,style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffA2A0A8),
                  ),),
                  SizedBox(height: 20.h),
                  Container(
                    height: 140.h,
                    width: 274.w,
                    child: Expanded(
                        child: Text(title,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                        ),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            if(index == 0)
            Container(
              height: 200.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 89.h,
                    width: 301.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xffF5F7FE),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Net Income',style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff52525C),
                              ),),
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  SvgPicture.asset(Assets.DOWN,width: 20.w,height: 20.h,),
                                  SizedBox(width: 5.w,),
                                  Text('\$4,500',style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff000000),
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Total Product',style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff52525C),
                              ),),
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  SvgPicture.asset(Assets.UP,width: 20.w,height: 20.h,),
                                  SizedBox(width: 5.w,),
                                  Text('\$1,691',style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff000000),
                                  ),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  SvgPicture.asset(Assets.ARROW,height: 65.h,width: 146.w,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}