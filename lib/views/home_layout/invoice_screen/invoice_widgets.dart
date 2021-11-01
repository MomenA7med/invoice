import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:invoice/constants/widgets.dart';
import 'package:invoice/models/product_model.dart';

Widget buildInvoiceItem(String clinetName,String invoiceNum,String date,String amount){
  return Container(
    width: double.infinity,
    child: Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(clinetName,style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
            ),),
            Text(invoiceNum,style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
            ),),
            Text(date,style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
            ),),
            Text(amount,style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
            ),),
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
  }){
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
            SizedBox(height: 10,),
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

Widget buildPriceItem(){
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
          Row(
            children: [
              Text('التخفيض: '),
              Text('100'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text('ضريبة القيمة المضافة: '),
              Text('13%'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text('المبلغ الكلي: '),
              Text('100'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text('المبلغ المستحق: '),
              Text('100'),
            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    ),
  );
}

Widget buildInstructionItem(){
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
          SizedBox(height: 10,),
          defaultButon(text: 'التوقيع', function: (){}),
          SizedBox(height: 10,),
          Text('الملاحظات'),
        ],
      ),
    ),
  );
}

Widget buildListProucts({required List<ProductModel> products,required BuildContext context}){
  return ListView.separated(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context,index) {
      return buildProductItem(productModel: products[index]);
    },
    separatorBuilder: (context,index) => SizedBox(height: 10,),
    itemCount: products.length
    );
}

Widget buildProductItem({required ProductModel productModel}){
  return Card(
    elevation: 5,
    color: Colors.grey[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productModel.productName),
              Text('سعر المنتج : '+productModel.productPrice),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الكمية : '+productModel.amount),
              Text('التكلفة : '+productModel.productCost),
            ],
          ),
        ],
      ),
    ),
  );
}