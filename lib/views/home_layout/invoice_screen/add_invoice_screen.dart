import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/models/product_model.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/views/home_layout/invoice_screen/invoice_widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddInvoiceScreen extends StatefulWidget {
  const AddInvoiceScreen({ Key? key }) : super(key: key);

  @override
  _AddInvoiceScreenState createState() => _AddInvoiceScreenState();
}

class _AddInvoiceScreenState extends State<AddInvoiceScreen> {

  int choose = 0;

  List<ProductModel> products = [
    ProductModel('كرة','15','20',true,'5'),
    ProductModel('عربية','15','20',true,'5'),
    ProductModel('قلم','15','20',true,'5'),
  ];
  
  ProductModel? selectedProduct;
  List<ProductModel> addedProducts = [];

  DateTime? date;

  String? dateString;

  var priceController = TextEditingController();
  var amountController = TextEditingController();
  var numberController = TextEditingController();
  var busnissController = TextEditingController();

  File? image,imageSign;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(Languages.of(context)!.kClient),),
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: ((value){}),
            itemBuilder: (context) {
              return {'مسح','مشاركة','طباعة'}.map((String choice) {
                return PopupMenuItem<String>(child: Text(choice),value: choice,);
              }).toList();
            },
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ToggleSwitch(
                totalSwitches: 3,
                activeBgColors: [[Colors.red],[Colors.blue],[Colors.black]],
                activeFgColor: Colors.white,
                minWidth: 150.0,
                cornerRadius: 20.0,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                labels: [Languages.of(context)!.kEdit,Languages.of(context)!.kPreview,Languages.of(context)!.kHistory],
                onToggle: (index){
                  setState(() {
                    choose = index;
                  });
                },
                animate: true,
                fontSize: 20,
                initialLabelIndex: choose,
                ),
                SizedBox(height: 10,),
                if(choose == 0)
                Container(
                  child: Column(
                    children: [
                      buildInfoInvoice(function: (){
                        showModalBottomSheet(
                          context: context,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (_){
                          return DraggableScrollableSheet(
                            maxChildSize: 0.9,
                            minChildSize: 0.6,
                            initialChildSize: 0.6,
                            builder: (_,sheetScrolableController){
                            return StatefulBuilder(
                              builder: (ctx,myState){
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAlias,
                                  child: Scaffold(
                                    body: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 20,),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 15),
                                              child: defaultTextField(controller: numberController, text: Languages.of(context)!.kInvoiceNum),
                                            ),
                                            SizedBox(height: 20,),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 15),
                                              child: defaultTextField(controller: busnissController, text: Languages.of(context)!.kBusinessInfo),
                                            ),
                                            SizedBox(height: 20,),
                                            FlatButton(
                                              onPressed: () async{
                                              date = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(DateTime.now().year - 50),
                                              lastDate: DateTime(DateTime.now().year + 50),
                                              );
                                              myState((){
                                              dateString = '${date!.day.toString()}/${date!.month.toString()}/${date!.year.toString()}';
                                              });
                                            },
                                              child: Container(
                                                height: 60,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  )
                                                ),
                                                //margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                                                padding: EdgeInsets.symmetric(horizontal: 12),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.date_range,
                                                      color: Colors.black87,
                                                      size: 25,
                                                    ),
                                                    SizedBox(width: 20),
                                                    Text(
                                                      dateString ?? Languages.of(context)!.kChooseDate,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height:20),
                                            defaultButon(text: Languages.of(context)!.kSave, function: (){
                                              setState((){});
                                            },width: 200.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                        });
                      },
                      info: busnissController.text.isEmpty ? Languages.of(context)!.kBusinessInfo : busnissController.text,
                      invoiceNum: numberController.text.isEmpty ? Languages.of(context)!.kInvoiceNum : numberController.text,
                      date: dateString ?? Languages.of(context)!.kInvoiceDate,
                      type: Languages.of(context)!.kDue
                      ),
                      SizedBox(height: 10,),
                      Text(Languages.of(context)!.kProducts,style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 10,),
                      buildListProucts(products: addedProducts, context: context),
                      SizedBox(height: 10,),
                      defaultButon(text: Languages.of(context)!.kAddProducts, function:(){
                        showModalBottomSheet(
                         context: context,
                         elevation: 5,
                         backgroundColor: Colors.transparent,
                         isScrollControlled: true,
                         builder: (_){
                          return DraggableScrollableSheet(
                            maxChildSize: 0.9,
                            minChildSize: 0.6,
                            initialChildSize: 0.6,
                            builder: (_,sheetScrolableController){
                              return StatefulBuilder(builder: (ctx,myState){
                                return ClipRRect(
                                   borderRadius: BorderRadius.circular(20),
                                   clipBehavior: Clip.antiAlias,
                                   child: Scaffold(
                                     body: Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: SingleChildScrollView(
                                         child: Column(
                                           children: [
                                             SizedBox(height: 10,),
                                             DropdownSearch<ProductModel>(
                                               mode: Mode.MENU,
                                               label: Languages.of(context)!.kChooseProduct,
                                               showSearchBox: true,
                                               dialogMaxWidth: double.infinity,
                                               dropdownButtonSplashRadius: 20.0,
                                               popupElevation: 5,
                                               dropdownSearchDecoration: InputDecoration(
                                                 border: InputBorder.none,
                                               ),
                                               dropdownSearchBaseStyle: TextStyle(
                                                 fontSize: 20,
                                                 fontWeight: FontWeight.bold,
                                               ),
                                               itemAsString: (ProductModel? p) => p!.productName,
                                               items: products,
                                               onChanged: (product){
                                                 myState((){
                                                   selectedProduct = product!;
                                                   priceController.text = selectedProduct!.productPrice;
                                                   amountController.text = selectedProduct!.amount;
                                                 });
                                               },
                                             ),
                                             SizedBox(height: 10,),
                                             defaultTextField(controller: priceController, text: Languages.of(context)!.kProductPrice),
                                             SizedBox(height: 10,),
                                             defaultTextField(controller: amountController, text: Languages.of(context)!.kAmount),
                                             SizedBox(height: 10,),
                                             defaultButon(text: Languages.of(context)!.kAddProducts,width: 100.0, function: (){
                                               setState(() {
                                                 addedProducts.add(ProductModel(
                                                 selectedProduct!.productName,
                                                 priceController.text,
                                                 (double.parse(priceController.text)*double.parse(amountController.text)).toStringAsFixed(2),
                                                 selectedProduct!.texable,
                                                 amountController.text,
                                               ));
                                               });
                                               print(addedProducts.length.toString());
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
                      },width: 100.0),
                      SizedBox(height: 10,),
                      buildPriceItem(),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            defaultButon(text: Languages.of(context)!.kAddPhoto, function:() async {
                              ImagePicker picker = ImagePicker();
                              final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                              if(pickedFile != null){
                                setState(() {
                                  image = File(pickedFile.path);
                                });
                              }
                            },width: 100.0),
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 30,
                              backgroundImage:  image ==null ? null : FileImage(File(image!.path)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Card(
                        elevation: 5,
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(Languages.of(context)!.kPaymentInstruction),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  defaultButon(text: Languages.of(context)!.kSigniture, function: () async{
                                    ImagePicker picker = ImagePicker();
                                    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                                    if(pickedFile != null){
                                      setState(() {
                                        imageSign = File(pickedFile.path);
                                      });
                                    }
                                  },width: 100.0),
                                  CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 30,
                                  backgroundImage:  imageSign ==null ? null : FileImage(File(imageSign!.path)),
                                ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(Languages.of(context)!.kNotes),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      defaultButon(text: Languages.of(context)!.kPaid, function:(){}),
                    ],
                  ),
                ),
                if(choose == 1)
                Container(
                  child: Column(
                    children: [
                      if(image != null)
                      Container(
                        //width: double.infinity,
                        height: MediaQuery.of(context).size.width*.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: FileImage(File(image!.path),
                          ),fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 10,),
                      buildInfoInvoice(
                        function: (){},
                        info: busnissController.text.isEmpty ? Languages.of(context)!.kBusinessInfo : busnissController.text,
                        invoiceNum: numberController.text.isEmpty ? Languages.of(context)!.kInvoiceNum : numberController.text,
                        date: dateString ?? Languages.of(context)!.kInvoiceDate,
                        type: Languages.of(context)!.kDue
                      ),
                      SizedBox(height: 10,),
                      Text(Languages.of(context)!.kProducts,style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 10,),
                      buildListProucts(products: addedProducts, context: context),
                      SizedBox(height: 10,),
                      buildPriceItem(),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }



}