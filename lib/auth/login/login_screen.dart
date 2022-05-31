import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/auth/login/forget_password.dart';
import 'package:invoice/auth/sign_up/sign_up_screen.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/view_model/login_cubit.dart';
import 'package:invoice/view_model/login_state.dart';
import 'package:invoice/views/company_create_screen.dart';
import 'package:invoice/views/home_layout/home_layout.dart';
import 'package:invoice/views/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({ Key? key }) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            AppNavigator.pushReplacement(context: context, widget: HomeLayout());
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                SafeArea(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20.0.h,horizontal: 20.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back,color: Color(0xff002D84),
                            ),
                          ),
                          SizedBox(height: 30.h,),
                          Text('Hi, Welcome Back! ',style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w800,
                          ),),
                          SizedBox(height: 5.h,),
                          Text('Sign in to your account.',style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffA2A0A8),
                          ),),
                          SizedBox(height: 30.h,),
                          inputField(hint: 'Email',asset: Assets.EMAIL,controller: emailController),
                          SizedBox(height: 20.h,),
                          inputField(hint: 'Password',asset: Assets.LOCK,controller: passwordController),
                          SizedBox(height: 20.h,),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: InkWell(
                              onTap: (){
                                AppNavigator.pushTo(context: context, widget: ForgetPasswordScreen());
                              },
                              child: Text('Forgot Password?',style: TextStyle(
                                  color: Color(0xff002D84),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          appButton(text: Languages.of(context)!.kLogin, onTab: (){
                            LoginCubit.get(context).loginUser(email: emailController.text, password: passwordController.text, scaffoldKey: scaffoldKey);
                            //AppNavigator.pushTo(context: context, widget: OtpAuthentication());
                          }),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have account?',style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Color(0xff9CA3AF)
                              ),),
                              TextButton(onPressed: (){
                                AppNavigator.pushTo(context: context, widget: SignUpScreen());
                              }, child: Text(Languages.of(context)!.kRegister,style: TextStyle(
                                fontSize: 16.sp,
                              ),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if(LoginCubit.get(context).isLoading)
                loading(),
              ],
            ),
          );
        },
      ),
    );
  }
}