import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/auth/login/reset_your_password.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/views/setting/change_language.dart';
import 'package:invoice/views/setting/vat_screen.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff002D84),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff002D84),
          title: Center(
            child: Text('Setting'),
          ),
          toolbarHeight: 70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: ClipRRect(
            borderRadius: BorderRadius.circular(30.r),
            child: Container(
                color: Colors.white,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h,),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 25.r,
                          backgroundImage: NetworkImage('https://scontent.fcai19-4.fna.fbcdn.net/v/t1.6435-9/73094736_3209657919173097_5232319590247170048_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=174925&_nc_eui2=AeG789kubJW-htPaa-MOLybwYVyUjOndsD9hXJSM6d2wP3FQNoQtB1A-lpPID3tX73NBpEvZVLQzg05_FXIOyn03&_nc_ohc=CgCq-B4YHpsAX9qe0Qi&_nc_ht=scontent.fcai19-4.fna&oh=00_AT90aVqERK88q3PveM7G2cQG-qXyv0CHtGW93juaDxacGA&oe=620FBBF9'),
                        ),
                        title: Text('Momen Ahmed',style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff002D84),
                        ),),
                        subtitle: Text('moamenahmed@selectionvalley.com',style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff002D84),
                        ),),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text('General',style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffA2A0A8),
                        ),),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: (){
                          AppNavigator.pushTo(context: context, widget: VatScreen());
                        },
                        child: ListTile(
                          leading: Text('VAT',style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: (){
                          AppNavigator.pushTo(context: context, widget: ChangeLanguageScreen());
                        },
                        child: ListTile(
                          leading: Text('Language',style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: (){
                          AppNavigator.pushTo(context: context, widget: ResetYourPassword());
                        },
                        child: ListTile(
                          leading: Text('Reset Password',style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListTile(
                        leading: Text('Privacy Policy',style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListTile(
                        leading: Text('About us',style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('Log out',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: Color(0xffFB4E4E),
                        ),),
                      )
                    ],
                  ),
                ),
            ),
        ),
    );
  }
}
