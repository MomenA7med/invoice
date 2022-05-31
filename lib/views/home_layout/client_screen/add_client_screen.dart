import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/view_model/home_cubit.dart';
import 'package:invoice/view_model/home_state.dart';
import 'package:invoice/views/home_layout/home_layout.dart';
import 'package:invoice/views/widgets/widgets.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({Key? key}) : super(key: key);

  @override
  _AddClientScreenState createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  int choose = 0;

  bool checkBox = false;

  final emailController = TextEditingController();

  final addressController = TextEditingController();

  final fNameController = TextEditingController();

  final lNameController = TextEditingController();

  final phoneController = TextEditingController();

  final vatController = TextEditingController();

  final crController = TextEditingController();

  final faxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is AddClientStateSuccess) {
            AppNavigator.pushReplacement(
                context: context,
                widget: HomeLayout(
                  pageIndex: 3,
                ));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: Color(0xff002D84),
                appBar: AppBar(
                  backgroundColor: Color(0xff002D84),
                  title: Center(
                    child: Text('Add Clients'),
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
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        choose = 0;
                                      });
                                    },
                                    child: Container(
                                      width: 147.w,
                                      height: 56.h,
                                      decoration: BoxDecoration(
                                        color: choose == 0
                                            ? Color(0xff31CB47)
                                            : Color(0xffF9F9FA),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 32.w,
                                            height: 32.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                                child: SvgPicture.asset(
                                              Assets.USER,
                                              color: choose == 0
                                                  ? Color(0xff31CB47)
                                                  : Color(0xffF9F9FA),
                                              width: 17.w,
                                              height: 17.h,
                                            )),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            'Individual',
                                            style: TextStyle(
                                              color: choose == 0
                                                  ? Colors.white
                                                  : Color(0xffA2A0A8),
                                              fontSize: 16.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        choose = 1;
                                      });
                                    },
                                    child: Container(
                                      width: 147.w,
                                      height: 56.h,
                                      decoration: BoxDecoration(
                                        color: choose == 1
                                            ? Color(0xff31CB47)
                                            : Color(0xffF9F9FA),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 32.w,
                                            height: 32.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                                child: SvgPicture.asset(
                                              Assets.BUSINESS,
                                              color: choose == 1
                                                  ? Color(0xff31CB47)
                                                  : Color(0xffF9F9FA),
                                              width: 17.w,
                                              height: 17.h,
                                            )),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            'Company',
                                            style: TextStyle(
                                              color: choose == 1
                                                  ? Colors.white
                                                  : Color(0xffA2A0A8),
                                              fontSize: 16.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: inputFieldWithoutAsset(
                                          hint: 'First Name',
                                          controller: fNameController)),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  Expanded(
                                      child: inputFieldWithoutAsset(
                                          hint: 'Last Name',
                                          controller: lNameController)),
                                ],
                              ),
                              if (choose == 1)
                                SizedBox(
                                  height: 20.h,
                                ),
                              if (choose == 1)
                                inputField(
                                    hint: 'Company name',
                                    asset: Assets.BUSINESS),
                              if (choose == 1)
                                SizedBox(
                                  height: 20.h,
                                ),
                              if (choose == 1)
                                Row(
                                  children: [
                                    Expanded(
                                      child: inputFieldWithoutAsset(
                                          hint: 'CR', controller: crController),
                                    ),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                    Expanded(
                                        child: inputFieldWithoutAsset(
                                            hint: 'VAT',
                                            controller: vatController)),
                                  ],
                                ),
                              SizedBox(
                                height: 20.h,
                              ),
                              inputField(
                                  hint: 'Address',
                                  asset: Assets.ADDRESS,
                                  controller: addressController),
                              SizedBox(
                                height: 20.h,
                              ),
                              inputField(
                                  hint: 'Phone Number',
                                  asset: Assets.CALL,
                                  controller: phoneController),
                              SizedBox(
                                height: 20.h,
                              ),
                              inputField(
                                  hint: 'Email',
                                  asset: Assets.EMAIL,
                                  controller: emailController),
                              SizedBox(
                                height: 20.h,
                              ),
                              inputField(
                                  hint: 'Fax',
                                  asset: Assets.FAX,
                                  controller: faxController),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: checkBox,
                                      onChanged: (value) {
                                        setState(() {
                                          checkBox = value!;
                                        });
                                      }),
                                  Expanded(
                                    child: Text(
                                      'By creating an account, you aggree to our Terms and Conditions',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 256.w,
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    color: Color(0xff002D84),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      Languages.of(context)!.kCreate,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  HomeCubit.get(context).addClient(
                                      name: fNameController.text +
                                          ' ' +
                                          lNameController.text,
                                      phone: phoneController.text,
                                      address: addressController.text,
                                      email: emailController.text,
                                      fax: faxController.text,
                                      type: choose,
                                      cr: crController.text,
                                      vat: vatController.text.isNotEmpty
                                          ? int.parse(vatController.text)
                                          : null);
                                },
                                child: Container(
                                  width: 256.w,
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF5F7FE),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      Languages.of(context)!.kImportContant,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff31CB47),
                                      ),
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
                ),
              ),
              if (state is AddClientStateLoading) loading(),
            ],
          );
        },
      ),
    );
  }
}
