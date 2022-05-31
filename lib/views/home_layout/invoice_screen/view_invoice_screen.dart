import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/models/OrderIdModel.dart';

import '../../../utils/Navigator.dart';
import '../../../view_model/home_cubit.dart';
import '../../../view_model/home_state.dart';
import '../../widgets/widgets.dart';
import '../home_layout.dart';
import 'invoice_widgets.dart';

class ViewInvoiceScreen extends StatelessWidget {
  final int invoiceId;
  TextEditingController noteController = TextEditingController();
  ViewInvoiceScreen({required this.invoiceId});
  InvoiceByIdResponse? invoice;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getInvoiceById(invoiceId),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is DeleteInvoiceStateSuccess) {
            AppNavigator.pushReplacement(
                context: context,
                widget: HomeLayout(
                  pageIndex: 1,
                ));
          }
        },
        builder: (context, state) {
          invoice = HomeCubit.get(context).invoiceByIdResponse;
          if (HomeCubit.get(context).invoiceByIdResponse != null ||
              state is GetInvoiceStateSuccess) {
            noteController.text = invoice!.notes.toString();
            return Scaffold(
              backgroundColor: Color(0xff002D84),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Color(0xff002D84),
                title: Center(
                  child: Text('Invoice'),
                ),
                toolbarHeight: 70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                actions: [
                  PopupMenuButton<String>(
                    onSelected: ((value) {
                      if (value == 'مسح') {
                        HomeCubit.get(context)
                            .deleteInvoice(invoice!.id.toString());
                      }
                    }),
                    itemBuilder: (context) {
                      return {'مسح', 'مشاركة', 'طباعة'}.map((String choice) {
                        return PopupMenuItem<String>(
                          child: Text(choice),
                          value: choice,
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
              body: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: Container(
                  color: Colors.white,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 90.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Color(0xffF9F9FA),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w,
                                                vertical: 20.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'INFO',
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
                                                  'INVOICE #$invoiceId',
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w,
                                                vertical: 20.h),
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
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(DateTime.parse(
                                                          invoice!.createdAt!)),
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
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
                                          Text(
                                            'To',
                                            style: TextStyle(
                                                color: Color(0xffA2A0A8),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                invoice!.client!.name!,
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                invoice!.client!.fax.toString(),
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            invoice!.client!.address.toString(),
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            invoice!.client!.email.toString(),
                                            style: TextStyle(
                                                color: Color(0xffA2A0A8),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            invoice!.client!.phone.toString(),
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
                                    height: 10.h,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        // buildListProucts(
                                        //     products: HomeCubit.get(context)
                                        //         .invoiceByIdResponse!
                                        //         .products!,
                                        //     context: context),
                                        buildPriceItem(
                                            products: HomeCubit.get(context)
                                                .invoiceByIdResponse!
                                                .products!),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 87.h,
                                          //width: 311.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: Color(0xffF9F9FA),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: null,
                                              controller: noteController,
                                              decoration: InputDecoration(
                                                  hintText: 'Note',
                                                  hintStyle: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Color(0xffA2A0A8),
                                                  ),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(Assets.EDIT),
                                SvgPicture.asset(Assets.HISTORY),
                                SvgPicture.asset(Assets.SEND),
                                appButton(
                                    text: 'mark paid',
                                    onTab: () {},
                                    width: 200),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is DeleteInvoiceStateLoading)
            return loading();
          else
            return loading();
        },
      ),
    );
  }
}
