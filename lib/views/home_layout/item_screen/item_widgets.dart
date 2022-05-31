import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/models/ProductsModel.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';

Widget buildItemCard(
    {required String desc,
    required String salesPrice,
    required String image,
    required BuildContext context,
    required String qty}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 5,
    color: Colors.grey[200],
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Languages.of(context)!.kDescription + ' : ' + desc,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Languages.of(context)!.kSalesPrice + ' : ' + salesPrice,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    Languages.of(context)!.kQuantity + ' : ' + qty,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage(image)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildProductItem(Product product) {
  return ListTile(
    contentPadding: EdgeInsets.all(0.0),
    leading: CircleAvatar(
      radius: 40.r,
      backgroundImage: NetworkImage(kUrl + 'imgs/' + product.image!),
    ),
    title: Text(product.name!),
    subtitle: Text(product.description!),
    trailing: Text('\$' + product.price.toString()),
  );
}
