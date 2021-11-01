import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/auth/login/login_screen.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/view_model/company_cubit.dart';
import 'package:invoice/view_model/company_state.dart';
import 'package:invoice/views/home_layout/home_layout.dart';

class CompantCreateScreen extends StatelessWidget {
  CompantCreateScreen({ Key? key }) : super(key: key);

  final TextEditingController companyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          )
        ), 
      ),
      body: BlocProvider(
        create: (BuildContext context) => CompanyCubit(),
        child: BlocConsumer<CompanyCubit,CompanyState>(
          listener: (context,state){},
          builder: (context,state){
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        backgroundImage: CompanyCubit.get(context).companyImage == null ?
                        null
                        :  FileImage(File(CompanyCubit.get(context).companyImage!.path)) ,
                        radius: 62,
                        backgroundColor: Colors.grey[250],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.camera_alt_outlined),onPressed: () {
                        CompanyCubit.get(context).pickCompanyImage();
                      },),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  defaultTextField(controller: companyController, text: Languages.of(context)!.kCompanyName),
                  SizedBox(height: 10,),
                  defaultTextField(controller: emailController, text: Languages.of(context)!.kCompanyEmail),
                  SizedBox(height: 10,),
                  defaultTextField(controller: mobileController, text: Languages.of(context)!.kCompanyMobile),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){
                        AppNavigator.pushTo(context: context, widget: LoginScreen());
                      }, child: Text(Languages.of(context)!.kLogin)),
                    ],
                  ),
                  defaultButon(text: Languages.of(context)!.kGetCreateInvoice, function: (){
                    AppNavigator.pushTo(context: context, widget: HomeLayout());
                  }),
                ],
                        ),
              ),
          );
          },
        ),
      ),
    );
  }
}