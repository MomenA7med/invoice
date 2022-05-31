import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/models/GetClientsResponse.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';

Widget buildItemClient(
  Items item,
) {
  return ListTile(
    //contentPadding: EdgeInsets.all(0.0),
    // leading: CircleAvatar(
    //   radius: 40.r,
    //   backgroundImage: NetworkImage(
    //       'https://i.pinimg.com/originals/58/40/fe/5840feccd6c0b9fee9918e13c0a48225.png'),
    // ),
    title: Text(
      item.name.toString(),
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
    ),
    subtitle: Text(item.phone.toString()),
    trailing: Text(item.address.toString()),
  );
}

Widget buildIndividualBody({
  required TextEditingController nameController,
  required TextEditingController emailController,
  required TextEditingController phoneController,
  required TextEditingController infoController,
  required BuildContext context,
}) {
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
                defaultTextField(
                    controller: nameController,
                    text: Languages.of(context)!.kClientName),
                SizedBox(
                  height: 10,
                ),
                defaultTextField(
                    controller: emailController,
                    text: Languages.of(context)!.kCompanyEmail),
                SizedBox(
                  height: 10,
                ),
                defaultTextField(
                    controller: phoneController,
                    text: Languages.of(context)!.kCompanyMobile),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
