import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/view_model/app_cubit.dart';
import 'package:invoice/view_model/app_state.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({ Key? key }) : super(key: key);

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  bool active = false;
  final desController = TextEditingController();
  final costController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(Languages.of(context)!.kItem),),
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit,AppState>(
          listener: (context,state) {},
          builder: (context,state) {
            return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  defaultTextField(controller: desController, text: Languages.of(context)!.kDescription),
                  SizedBox(height: 15,),
                  defaultTextField(controller: costController, text: Languages.of(context)!.kItemCost),
                  SizedBox(height: 15,),
                  defaultTextField(controller: priceController, text: Languages.of(context)!.kSalesPrice),
                  SizedBox(height: 15,),
                  defaultTextField(controller: quantityController, text: Languages.of(context)!.kQuantity),
                  SizedBox(height: 15,),
                  Row(children: [
                    Text(Languages.of(context)!.kTaxable + ' : ',style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(width: 50,),
                    Switch(
                      splashRadius: 20,       
                      value: active,
                      onChanged: (value){
                        setState(() {
                          active = value;
                        });
                      },
                      activeColor: Colors.blue,
                      ),
                  ],),
                  SizedBox(height: 10,),
                  defaultTextField(controller: quantityController, text: Languages.of(context)!.kQuantity),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          elevation: 5,
                          isScrollControlled: true,
                          builder: (_) => DraggableScrollableSheet(
                          maxChildSize: 0.9,
                          minChildSize: 0.6,
                          initialChildSize: 0.6,
                          builder: (_, sheetScrollController) {
                            return StatefulBuilder(
                              builder: (ctx,myState) {
                                AppCubit.get(context).getImages();
                                return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                clipBehavior: Clip.antiAlias,
                                child: Scaffold(
                                  body: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 30,
                                          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(16)),
                                        ),
                                        SizedBox(height: 16,),
                                        Expanded(
                                            child: GridView.count(
                                              scrollDirection: Axis.vertical,
                                              controller: sheetScrollController,
                                              crossAxisCount: 2,
                                              childAspectRatio: 1,
                                              children: AppCubit.get(context).productImages.map((e) => 
                                              Stack(
                                                alignment: AlignmentDirectional.topStart,
                                                children: [
                                                  Card(
                                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Container(
                                                      width: 150,
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(image: FileImage(e)),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.red,
                                                    ),
                                                    width: 35,
                                                    height: 35,
                                                    child: Center(
                                                      child: IconButton(onPressed: (){
                                                        myState((){
                                                          AppCubit.get(context).deleteProductImage(AppCubit.get(context).productImages.indexOf(e));
                                                        });
                                                      }, icon: Icon(Icons.close),iconSize: 18,color: Colors.white),
                                                    ),
                                                  )
                                                ],
                                              )
                                              ).toList(),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(onPressed: (){
                                                AppCubit.get(context).pickProductImage().then((value) {
                                                  myState((){});
                                                });
                                              }, icon: Icon(Icons.image),iconSize: 50,alignment: Alignment.center,color: Colors.blueGrey,),
                                              SizedBox(width: 15,),
                                              Expanded(child: defaultButon(text: 'إضافة الصور', function: (){
                                                AppCubit.get(context).addImages(AppCubit.get(context).productImages);
                                              })),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              },
                            );
                          },
                        ));
                      }, icon: Icon(Icons.image),iconSize: 50,alignment: Alignment.center,color: Colors.blueGrey,),
                      SizedBox(width: 15,),
                      Expanded(child: defaultButon(text: Languages.of(context)!.kCreate, function: (){})),
                    ],
                  ),
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