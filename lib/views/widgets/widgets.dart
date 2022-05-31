import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

Widget inputField(
    {required String hint,
    required String asset,
    bool readOnly = false,
    TextEditingController? controller}) {
  return Container(
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
          SvgPicture.asset(
            asset,
            width: 22.w,
            height: 22.h,
            fit: BoxFit.cover,
            color: Color(0xff002D84),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: TextField(
              readOnly: readOnly,
              controller: controller,
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xffA2A0A8),
                  ),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget inputFieldWithoutAsset(
    {required String hint, TextEditingController? controller}) {
  return Container(
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
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xffA2A0A8),
                  ),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget appButton(
    {required String text,
    required void Function() onTab,
    double width = 256}) {
  return Align(
    alignment: AlignmentDirectional.center,
    child: InkWell(
      onTap: onTab,
      child: Container(
        width: width.w,
        height: 46.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Color(0xff002D84)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        )),
      ),
    ),
  );
}

Widget loading() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: Colors.black26,
    child: Center(
      child: Lottie.asset('assets/lottie/loading.json'),
    ),
  );
}
