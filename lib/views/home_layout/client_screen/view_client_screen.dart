import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/models/GetClientsResponse.dart';

import '../../../utils/Navigator.dart';
import '../../../view_model/home_cubit.dart';
import '../../../view_model/home_state.dart';
import '../../widgets/widgets.dart';
import '../home_layout.dart';

class ViewClientScreen extends StatefulWidget {
  final Items item;
  ViewClientScreen(this.item);

  @override
  State<ViewClientScreen> createState() => _ViewClientScreenState();
}

class _ViewClientScreenState extends State<ViewClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff002D84),
      appBar: AppBar(
        title: Center(
          child: Text('Client'),
        ),
        toolbarHeight: 70,
        backgroundColor: Color(0xff002D84),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Colors.white,
          height: double.infinity,
          child: BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is GetClientsStateSuccess) {
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
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: 150.w,
                                height: 150.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/profile_pic.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                widget.item.name.toString(),
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                '#' + widget.item.id.toString(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              // SizedBox(
                              //   height: 15.h,
                              // ),
                              // inputField(
                              //   hint: Languages.of(context)!.kItemCost,
                              //   asset: Assets.UNITE,
                              //   controller: costController,
                              // ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                height: 90.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Color(0xffF9F9FA),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w, vertical: 20.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'INFO',
                                              style: TextStyle(
                                                  color: Color(0xffA2A0A8),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              'CLIENT #${widget.item.id}',
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 20.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'DATE - TIME',
                                                style: TextStyle(
                                                    color: Color(0xffA2A0A8),
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                '${widget.item.createdAt}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                height: 138.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Color(0xffF9F9FA),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 20.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            widget.item.name!,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            widget.item.fax.toString(),
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        widget.item.address.toString(),
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        widget.item.email.toString(),
                                        style: TextStyle(
                                            color: Color(0xffA2A0A8),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        widget.item.phone.toString(),
                                        style: TextStyle(
                                            color: Color(0xffA2A0A8),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              appButton(
                                  text: 'Delete Client',
                                  onTab: () {
                                    HomeCubit.get(context).deleteClient(
                                        widget.item.id.toString());
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (state is DeleteClientStateLoading) loading(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
