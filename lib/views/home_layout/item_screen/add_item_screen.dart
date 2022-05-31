import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/view_model/home_cubit.dart';
import 'package:invoice/view_model/home_state.dart';
import 'package:invoice/views/widgets/widgets.dart';

import '../home_layout.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  bool active = false;
  final desController = TextEditingController();
  final codeController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff002D84),
      appBar: AppBar(
        title: Center(
          child: Text('Add Item'),
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
                if (state is AddProductStateSuccess) {
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
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            inputField(
                              hint: Languages.of(context)!.kDescription,
                              asset: Assets.TITLE,
                              controller: titleController,
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
                            inputField(
                              hint: Languages.of(context)!.kSalesPrice,
                              asset: Assets.SALES,
                              controller: priceController,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            inputField(
                                hint: 'Code',
                                asset: Assets.TITLE,
                                controller: codeController),
                            SizedBox(
                              height: 15.h,
                            ),
                            inputField(
                              hint: 'Prand Title',
                              asset: Assets.PRAND,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    HomeCubit.get(context).pickProductImage();
                                    // showModalBottomSheet(
                                    //   context: context,
                                    //   backgroundColor: Colors.transparent,
                                    //   elevation: 5,
                                    //   isScrollControlled: true,
                                    //   builder: (_) => DraggableScrollableSheet(
                                    //     maxChildSize: 0.9,
                                    //     minChildSize: 0.6,
                                    //     initialChildSize: 0.6,
                                    //     builder: (_, sheetScrollController) {
                                    //       return StatefulBuilder(
                                    //         builder: (ctx,myState) {
                                    //           AppCubit.get(context).getImages();
                                    //           return ClipRRect(
                                    //             borderRadius: BorderRadius.circular(20),
                                    //             clipBehavior: Clip.antiAlias,
                                    //             child: Scaffold(
                                    //               body: Padding(
                                    //                 padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
                                    //                 child: Column(
                                    //                   children: [
                                    //                     Container(
                                    //                       height: 5,
                                    //                       width: 30,
                                    //                       decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(16)),
                                    //                     ),
                                    //                     SizedBox(height: 16,),
                                    //                     Expanded(
                                    //                       child: GridView.count(
                                    //                         scrollDirection: Axis.vertical,
                                    //                         controller: sheetScrollController,
                                    //                         crossAxisCount: 2,
                                    //                         childAspectRatio: 1,
                                    //                         children: AppCubit.get(context).productImages.map((e) =>
                                    //                             Stack(
                                    //                               alignment: AlignmentDirectional.topStart,
                                    //                               children: [
                                    //                                 Card(
                                    //                                   elevation: 5,
                                    //                                   shape: RoundedRectangleBorder(
                                    //                                     borderRadius: BorderRadius.circular(10),
                                    //                                   ),
                                    //                                   child: Container(
                                    //                                     width: 150,
                                    //                                     height: 150,
                                    //                                     decoration: BoxDecoration(
                                    //                                       image: DecorationImage(image: FileImage(e)),
                                    //                                     ),
                                    //                                   ),
                                    //                                 ),
                                    //                                 Container(
                                    //                                   decoration: BoxDecoration(
                                    //                                     shape: BoxShape.circle,
                                    //                                     color: Colors.red,
                                    //                                   ),
                                    //                                   width: 35,
                                    //                                   height: 35,
                                    //                                   child: Center(
                                    //                                     child: IconButton(onPressed: (){
                                    //                                       myState((){
                                    //                                         AppCubit.get(context).deleteProductImage(AppCubit.get(context).productImages.indexOf(e));
                                    //                                       });
                                    //                                     }, icon: Icon(Icons.close),iconSize: 18,color: Colors.white),
                                    //                                   ),
                                    //                                 )
                                    //                               ],
                                    //                             )
                                    //                         ).toList(),
                                    //                       ),
                                    //                     ),
                                    //                     Row(
                                    //                       children: [
                                    //                         IconButton(onPressed: (){
                                    //                           AppCubit.get(context).pickProductImage().then((value) {
                                    //                             myState((){});
                                    //                           });
                                    //                         }, icon: Icon(Icons.image),iconSize: 50,alignment: Alignment.center,color: Colors.blueGrey,),
                                    //                         SizedBox(width: 15,),
                                    //                         Expanded(child: defaultButon(text: 'إضافة الصور', function: (){
                                    //                           AppCubit.get(context).addImages(AppCubit.get(context).productImages);
                                    //                         })),
                                    //                       ],
                                    //                     ),
                                    //                   ],
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //           );
                                    //         },
                                    //       );
                                    //     },
                                    //   ));
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
                                          CircleAvatar(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                            backgroundColor: Color(0xff002D84),
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Images',
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffA2A0A8),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                    child: inputField(
                                  controller: quantityController,
                                  hint: 'Qty',
                                  asset: Assets.LAYER,
                                )),
                              ],
                            ),
                            if (HomeCubit.get(context).productImage != null)
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      HomeCubit.get(context)
                                          .productImage!
                                          .path
                                          .split('/')
                                          .last,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            SizedBox(
                              height: 15.h,
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
                                      value: active,
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
                                  controller: desController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                      hintText: 'Add description',
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
                                  HomeCubit.get(context).addProduct(
                                      name: titleController.text,
                                      price: priceController.text,
                                      code: codeController.text,
                                      desc: desController.text,
                                      image:
                                          HomeCubit.get(context).imagePicked);
                                }),
                          ],
                        ),
                      ),
                    ),
                    if (state is AddClientStateLoading) loading(),
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
