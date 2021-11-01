import 'package:flutter/material.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';

Widget buildItemClient(String clientName,String clientType,BuildContext context){
  return Card(
    elevation: 5,
    color: Colors.grey[200],
    shadowColor: Colors.grey[50],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(Languages.of(context)!.kClientName,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),),
              SizedBox(width: 20,),
              Text(clientName,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Text(Languages.of(context)!.kType,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),),
              SizedBox(width: 20,),
              Text(clientType,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildIndividualBody({
  required TextEditingController nameController,
  required TextEditingController emailController,
  required TextEditingController phoneController,
  required TextEditingController infoController,
  required BuildContext context,
}
  ){
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
              ],),
            ),
          ),
      ],
    ),
  );
}

