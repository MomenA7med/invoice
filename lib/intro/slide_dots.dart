import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.3),
      height: isActive ? 8.h : 8.h,
      width: isActive ? 32.w : 8.w,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff002D84) : Colors.grey,
        border: isActive
            ? Border.all(
                color: Color(0xff002D84),
                width: 2.0,
              )
            : Border.all(
                color: Colors.transparent,
                width: 1,
              ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
