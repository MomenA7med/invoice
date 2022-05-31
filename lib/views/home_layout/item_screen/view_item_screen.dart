import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice/models/ProductsModel.dart';
import 'package:invoice/views/home_layout/item_screen/item_widgets.dart';

import '../../../constants/assets.dart';
import '../../../constants/constants.dart';
import '../../../utils/Localization/Languages/Languages.dart';
import '../../../utils/Navigator.dart';
import '../../../view_model/home_cubit.dart';
import '../../../view_model/home_state.dart';
import '../../widgets/widgets.dart';
import '../home_layout.dart';

class ViewItemScreen extends StatefulWidget {
  Product product;
  ViewItemScreen(this.product);

  @override
  State<ViewItemScreen> createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  bool active = false;

  final desController = TextEditingController();

  final codeController = TextEditingController();

  final priceController = TextEditingController();

  final quantityController = TextEditingController();

  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    priceController.text = widget.product.price.toString();
    quantityController.text =
        widget.product.amount == null ? '0' : widget.product.amount.toString();
    return Scaffold(
      backgroundColor: Color(0xff002D84),
      appBar: AppBar(
        title: Center(
          child: Text('Product'),
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
                if (state is DeleteInvoiceStateSuccess) {
                  AppNavigator.pushReplacement(
                      context: context,
                      widget: HomeLayout(
                        pageIndex: 2,
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
                              buildProductItem(widget.product),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                width: 300.w,
                                height: 200.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(kUrl +
                                          'imgs/' +
                                          widget.product.image!),
                                      fit: BoxFit.cover),
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
                                              'ITEM #${widget.product.code}',
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
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
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              widget.product.createdAt
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              inputField(
                                hint: Languages.of(context)!.kSalesPrice,
                                asset: Assets.SALES,
                                readOnly: true,
                                controller: priceController,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 56.h,
                                      //width: 311.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: Color(0xffF9F9FA),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              Assets.TAXABLE,
                                              width: 25.w,
                                              height: 25.h,
                                              fit: BoxFit.cover,
                                              color: Color(0xff002D84),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Expanded(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    hintText: 'Taxable',
                                                    hintStyle: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Color(0xffA2A0A8),
                                                    ),
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                            Switch(
                                              splashRadius: 20,
                                              value: true,
                                              onChanged: (value) {
                                                setState(() {
                                                  active = value;
                                                });
                                              },
                                              activeColor: Colors.blue,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Expanded(
                                      child: inputField(
                                    readOnly: true,
                                    controller: quantityController,
                                    hint: 'Qty',
                                    asset: Assets.LAYER,
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 87.h,
                                //width: 311.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Color(0xffF9F9FA),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    readOnly: true,
                                    controller: desController,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                        hintText: 'Description',
                                        hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          color: Color(0xffA2A0A8),
                                        ),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              appButton(
                                  text: 'Delete Item',
                                  onTab: () {
                                    HomeCubit.get(context).deleteProduct(
                                        widget.product.id.toString());
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (state is DeleteProductStateLoading) loading(),
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
