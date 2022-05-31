import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/auth/login/login_screen.dart';
import 'package:invoice/auth/otp/otp_auth.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/view_model/register_cubit.dart';
import 'package:invoice/view_model/register_state.dart';
import 'package:invoice/views/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final companyController = TextEditingController();
  final phoneController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();


  bool check = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterState>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            AppNavigator.pushTo(context: context, widget: OtpAuthentication());
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
                    padding: const EdgeInsets.all(15.0),
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
                          SizedBox(height: 20.h,),
                          Text('Getting Started',style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w800,
                          ),),
                          SizedBox(height: 5.h,),
                          Text('Create an account to continue!',style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffA2A0A8),
                          ),),
                          SizedBox(height: 20.h,),
                          Row(
                            children: [
                              Expanded(child: inputField(hint: 'First Name',asset: Assets.USER,controller: firstNameController)),
                              SizedBox(width: 5.w,),
                              Expanded(child: inputField(hint: 'Last Name',asset: Assets.USER,controller: lastNameController)),
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          inputField(hint: 'Company Name',asset: Assets.BUSINESS,controller: companyController),
                          SizedBox(height: 20.h,),
                          inputField(hint: 'Phone Number',asset: Assets.CALL,controller: phoneController),
                          SizedBox(height: 20.h,),
                          inputField(hint: 'Email',asset: Assets.EMAIL,controller: emailController),
                          SizedBox(height: 20.h,),
                          inputField(hint: 'Password',asset: Assets.LOCK,controller: passwordController),
                          SizedBox(height: 20.h,),
                          Row(
                            children: [
                              Checkbox(value: check, onChanged: (value){
                                setState(() {
                                  check = value!;
                                });
                              }),
                              Expanded(
                                child: Text('By creating an account, you aggree to our Terms and Conditions',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          appButton(text: Languages.of(context)!.kRegister, onTab: (){
                            RegisterCubit.get(context).registerUser(context,firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                phone: phoneController.text,
                                country: 'Egypt',
                                company: companyController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                scaffoldKey: scaffoldKey);
                          }),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(Languages.of(context)!.kHaveAccount,style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Color(0xff9CA3AF)
                              ),),
                              TextButton(onPressed: (){
                                AppNavigator.pushTo(context: context, widget: LoginScreen());
                              }, child: Text(Languages.of(context)!.kLogin,style: TextStyle(
                                fontSize: 16.sp,
                              ),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if(RegisterCubit.get(context).isLoading)
                  loading()
              ],
            ),
          );
        },
      ),
    );
  }
}