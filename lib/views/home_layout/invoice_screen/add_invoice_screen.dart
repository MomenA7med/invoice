import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/constants/singleton/UserSingleton.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/models/GetClientsResponse.dart';
import 'package:invoice/models/ProductsModel.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/view_model/home_cubit.dart';
import 'package:invoice/view_model/home_state.dart';
import 'package:invoice/views/home_layout/invoice_screen/invoice_widgets.dart';
import 'package:invoice/views/widgets/widgets.dart';

import '../home_layout.dart';

class AddInvoiceScreen extends StatefulWidget {
  const AddInvoiceScreen({Key? key}) : super(key: key);

  @override
  _AddInvoiceScreenState createState() => _AddInvoiceScreenState();
}

class _AddInvoiceScreenState extends State<AddInvoiceScreen> {
  int choose = 0;

  Product? selectedProduct;
  List<Product> addedProducts = [];

  DateTime? date;

  String? dateString;

  var priceController = TextEditingController();
  var amountController = TextEditingController();
  var noteController = TextEditingController();
  var titleController = TextEditingController();

  File? image, imageSign;
  Items? currentItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff002D84),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff002D84),
        title: Center(
          child: Text('Add Invoice'),
        ),
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: ((value) {}),
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
      body: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit()
          ..getClients(id: UserSingleton().user!.company!.id.toString())
          ..getProducts(id: UserSingleton().user!.company!.id.toString()),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is CreateInvoiceStateSuccess) {
              AppNavigator.pushReplacement(
                  context: context,
                  widget: HomeLayout(
                    pageIndex: 1,
                  ));
            }
          },
          builder: (context, state) {
            if ((HomeCubit.get(context).clientsResponse != null &&
                    HomeCubit.get(context).productsResponse != null) ||
                state is CreateInvoiceStateLoading)
              return ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: Container(
                  color: Colors.white,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
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
                                    child: Text(
                                      currentItem == null
                                          ? 'Select Client'
                                          : currentItem!.name!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                        color: Color(0xffA2A0A8),
                                      ),
                                    ),
                                  ),
                                  DropdownButton<Items>(
                                    items: HomeCubit.get(context)
                                        .clientsResponse!
                                        .items!
                                        .map((e) {
                                      return DropdownMenuItem<Items>(
                                        child: Text(e.name!),
                                        value: e,
                                      );
                                    }).toList(),
                                    iconEnabledColor: kSplashColor,
                                    elevation: 3,
                                    iconSize: 35,
                                    icon: SvgPicture.asset(Assets.ARROW_DOWN),
                                    underline: SizedBox(),
                                    onChanged: (Items? value) {
                                      setState(() {
                                        currentItem = value;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          if (currentItem != null)
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          currentItem!.name!,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          currentItem!.fax!,
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
                                      currentItem!.address!,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      currentItem!.email!,
                                      style: TextStyle(
                                          color: Color(0xffA2A0A8),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      currentItem!.phone!,
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
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  elevation: 5,
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  builder: (_) {
                                    return DraggableScrollableSheet(
                                        maxChildSize: 0.9,
                                        minChildSize: 0.6,
                                        initialChildSize: 0.6,
                                        builder: (_, sheetScrolableController) {
                                          return StatefulBuilder(
                                              builder: (ctx, myState) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              clipBehavior: Clip.antiAlias,
                                              child: Scaffold(
                                                body: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        DropdownSearch<Product>(
                                                          mode: Mode.MENU,
                                                          label: Languages.of(
                                                                  context)!
                                                              .kChooseProduct,
                                                          showSearchBox: true,
                                                          dialogMaxWidth:
                                                              double.infinity,
                                                          dropdownButtonSplashRadius:
                                                              20.0,
                                                          popupElevation: 5,
                                                          dropdownSearchDecoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          dropdownSearchBaseStyle:
                                                              TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          itemAsString:
                                                              (Product? p) =>
                                                                  p!.name!,
                                                          items: HomeCubit.get(
                                                                  context)
                                                              .productsResponse!
                                                              .product!,
                                                          onChanged: (product) {
                                                            myState(() {
                                                              selectedProduct =
                                                                  product!;
                                                              priceController
                                                                      .text =
                                                                  selectedProduct!
                                                                      .price!
                                                                      .toString();
                                                            });
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        defaultTextField(
                                                            controller:
                                                                priceController,
                                                            text: Languages.of(
                                                                    context)!
                                                                .kProductPrice),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        defaultTextField(
                                                            controller:
                                                                amountController,
                                                            text: Languages.of(
                                                                    context)!
                                                                .kAmount),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        appButton(
                                                            text: Languages.of(
                                                                    context)!
                                                                .kAddProducts,
                                                            onTab: () {
                                                              setState(() {
                                                                selectedProduct!
                                                                        .amount =
                                                                    int.parse(
                                                                        amountController
                                                                            .text);
                                                                addedProducts.add(
                                                                    selectedProduct!);
                                                              });
                                                              print(addedProducts
                                                                  .length
                                                                  .toString());
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                        });
                                  });
                            },
                            child: Container(
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
                                      child: Text(
                                        'Select Item/Product',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                          color: Color(0xffA2A0A8),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 32.w,
                                      height: 32.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Color(0xff002D84),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                                buildListProucts(
                                    products: addedProducts, context: context),
                                buildPriceItem(products: addedProducts),
                                SizedBox(
                                  height: 10,
                                ),
                                inputFieldWithoutAsset(
                                    hint: 'Invoice title',
                                    controller: titleController),
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
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      controller: noteController,
                                      decoration: InputDecoration(
                                          hintText: 'Add note',
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
                                    text: Languages.of(context)!.kCreate,
                                    onTab: () {
                                      double net = 0.0;
                                      addedProducts.forEach((element) {
                                        net +=
                                            (element.amount * element.price!);
                                      });
                                      HomeCubit.get(context).createInvoice(
                                          products: addedProducts,
                                          note: noteController.text,
                                          clientId: currentItem!.id!.toInt(),
                                          status: 0,
                                          title: titleController.text,
                                          net: net);
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            else
              return loading();
          },
        ),
      ),
    );
  }
}
