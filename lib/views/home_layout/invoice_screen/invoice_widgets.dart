import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/models/GetInvoicesRespnse.dart';
import 'package:invoice/models/ProductsModel.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/views/home_layout/invoice_screen/view_invoice_screen.dart';

Widget buildInvoiceItem(
    String clinetName, String invoiceNum, String date, String amount) {
  return Container(
    width: double.infinity,
    child: Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              clinetName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              invoiceNum,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildInfoInvoice({
  required VoidCallback function,
  required String type,
  required String invoiceNum,
  required String info,
  required String date,
}) {
  return GestureDetector(
    onTap: function,
    child: Card(
      elevation: 5,
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(invoiceNum),
                Text(type),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(info),
                Text(date),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildInvoicItem(Items item, BuildContext context) {
  return InkWell(
    onTap: () {
      AppNavigator.pushTo(
          context: context, widget: ViewInvoiceScreen(invoiceId: item.id!));
    },
    child: ListTile(
      contentPadding: EdgeInsets.all(0.0),
      leading: CircleAvatar(
        radius: 40.r,
        backgroundImage: NetworkImage(
            'https://i.pinimg.com/originals/58/40/fe/5840feccd6c0b9fee9918e13c0a48225.png'),
      ),
      title: Text(item.title!),
      subtitle: Text(item.notes!),
      trailing: Text(item.id.toString()),
    ),
  );
}

Widget buildPriceItem({required List<Product> products}) {
  double subTotal = 0.0;
  products.forEach((element) {
    subTotal += (element.price! * element.amount);
  });
  return Container(
    child: Column(
      children: [
        Container(
          //height: 144.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
            color: Color(0xffF9F9FA),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey,
                        ),
                      ),
                      width: 100.w,
                    ),
                    Text(
                      'Rate',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Qty',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'SubTotal',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 1.h,
                  color: Colors.grey[300],
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 135.w,
                        child: Text(
                          products[index].name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: 65.w,
                        child: Text(
                          '\$${products[index].price}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: 60.w,
                        child: Text(
                          '${products[index].amount}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        '\$${products[index].price! * products[index].amount}',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemCount: products.length,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          height: 144.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r)),
            color: Color(0xffF9F9FA),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '\$ ${subTotal.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '\$00,000',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TAX',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '14 %',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'GRAND TOTAL',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        color: Color(0xffD85D17),
                      ),
                    ),
                    Text(
                      '\$ ${subTotal.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildInstructionItem() {
  return Card(
    elevation: 5,
    color: Colors.grey[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text('تعليمات الدفع'),
          SizedBox(
            height: 10,
          ),
          defaultButon(text: 'التوقيع', function: () {}),
          SizedBox(
            height: 10,
          ),
          Text('الملاحظات'),
        ],
      ),
    ),
  );
}

Widget buildListProucts({
  required List<Product> products,
  required BuildContext context,
}) {
  return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return buildProductItem(productModel: products[index]);
      },
      separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
      itemCount: products.length);
}

Widget buildProductItem({required Product productModel}) {
  return Container(
    height: 56.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      color: Color(0xffF9F9FA),
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(kUrl + 'imgs/' + productModel.image!),
      ),
      title: Text(productModel.name!),
      subtitle: Text(productModel.price.toString()),
      trailing: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
              width: 5,
            ),
            Text(productModel.amount.toString()),
            SizedBox(
              width: 5,
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
                  '-',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Color(0xff002D84),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  // return Card(
  //   elevation: 5,
  //   color: Colors.grey[100],
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(20),
  //   ),
  //   child: Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(productModel.productName),
  //             Text('سعر المنتج : '+productModel.productPrice),
  //           ],
  //         ),
  //         SizedBox(height: 10,),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text('الكمية : '+productModel.amount),
  //             Text('التكلفة : '+productModel.productCost),
  //           ],
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}
