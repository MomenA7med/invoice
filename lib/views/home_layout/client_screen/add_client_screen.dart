import 'package:flutter/material.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/views/home_layout/client_screen/client_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({ Key? key }) : super(key: key);

  @override
  _AddClientScreenState createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  
  int choose = 0;
  
  bool? checkBox = false;

  final emailController  = TextEditingController();

  final infoController = TextEditingController();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final vatController = TextEditingController();

  final crController = TextEditingController();

  final nameeController = TextEditingController();

  final phoneeController = TextEditingController();

  final emaillController  = TextEditingController();

  Widget buildCompanyBody({
 required TextEditingController nameController,
 required TextEditingController emailController,
 required TextEditingController phoneController,
 required TextEditingController vatController,
 required TextEditingController crController,
 required BuildContext context, 
}){
  if(checkBox == true){
    emaillController.text = emailController.text;
    phoneeController.text = phoneController.text;
    nameeController.text = nameController.text;
  }else{
    emaillController.text = '';
    phoneeController.text = '';
    nameeController.text = '';
  }
  return Container(
    child: Column(
      children: [
        Card(
            elevation: 5,
            color: Colors.grey[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  defaultTextField(controller: nameController, text: Languages.of(context)!.kClientName),
                  SizedBox(height: 10,),
                  defaultTextField(controller: emailController, text: Languages.of(context)!.kCompanyEmail),
                  SizedBox(height: 10,),
                  defaultTextField(controller: phoneController, text: Languages.of(context)!.kCompanyMobile),
                  SizedBox(height: 10,),
                  defaultTextField(controller: crController, text: Languages.of(context)!.kCr),
                  SizedBox(height: 10,),
                  defaultTextField(controller: vatController, text: Languages.of(context)!.kVat),
                ],),
              ),
            ),
             CheckboxListTile(
              value: checkBox,
              title: Text(
                Languages.of(context)!.kContactPerson,
                style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              onChanged: (value){
                  setState(() {
                    checkBox = value;
                  });
              }),
            Card(
            elevation: 5,
            color: Colors.grey[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  defaultTextField(controller: nameeController, text: Languages.of(context)!.kClientName),
                  SizedBox(height: 10,),
                  defaultTextField(controller: emaillController, text: Languages.of(context)!.kCompanyEmail),
                  SizedBox(height: 10,),
                  defaultTextField(controller: phoneeController, text: Languages.of(context)!.kCompanyMobile),
                ],),
              ),
            ),
      ],
    ),
  );
}

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10,),
                    ToggleSwitch(
                      totalSwitches: 2,
                      activeBgColors: [[Colors.red],[Colors.blue]],
                      activeFgColor: Colors.white,
                      minWidth: 150.0,
                      cornerRadius: 20.0,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      labels: [Languages.of(context)!.kIndividual,Languages.of(context)!.kCompany],
                      onToggle: (index){
                        setState(() {
                          choose = index;
                        });
                      },
                      animate: true,
                      fontSize: 20,
                      initialLabelIndex: choose,
                    ), 
                  ],
                ),
                SizedBox(height: 20,),
                choose == 1 ? buildCompanyBody(
                  nameController: nameController,
                  emailController: emailController, 
                  phoneController: phoneController, 
                  vatController: vatController, 
                  crController: crController, 
                  context: context) :
                buildIndividualBody(
                  nameController: nameController, 
                  emailController: emailController, 
                  phoneController: phoneController, 
                  infoController: infoController,
                  context: context),
                SizedBox(height: 20,),
                defaultTextField(controller: infoController, text: Languages.of(context)!.kInfo),
                SizedBox(height: 20,),
                defaultButon(text: Languages.of(context)!.kImportContant, function: (){},width: 250.0),
                SizedBox(height: 20,),
                Row(
                  children: [
                    defaultButon(text: Languages.of(context)!.kAdd, function: (){},width: 100.0),
                    SizedBox(width: 20,),
                    Expanded(child: defaultButon(text: Languages.of(context)!.kAddAndCreateInvoice, function: (){})),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}