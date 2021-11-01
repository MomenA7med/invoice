import 'package:flutter/material.dart';
import 'package:invoice/views/home_layout/item_screen/item_widgets.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildItemCard(
                desc: 'هذه نبذة مختصرة عن النتج , انه منتج ذو خامة جيدة وبسعر مناسب جداً ,هيا ابدا فى عمل الفاتورة ولا تتأخر عن العرض',
                salesPrice: '22',
                image: 'https://m.media-amazon.com/images/I/51IM+jkaEbL._SY450_.jpg',
                context: context,
                qty: '3'),
              SizedBox(height: 10,), 
              buildItemCard(
                desc: 'هذا وصف بسيط للمنتج',
                salesPrice: '55',
                image: 'https://i.dlpng.com/static/png/4653354-nike-football-transparent-image-png-arts-football-images-png-480_480_preview.png',
                context: context,
                qty: '1'),
                SizedBox(height: 10,), 
              buildItemCard(
                desc: 'هذا وصف بسيط للمنتج',
                salesPrice: '44',
                image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0YCxu6sOua_gmNVDbeCEUb7izU8Hpxi3W6Q&usqp=CAU',
                context: context,
                qty: '2'),
            ],
          ),
        ),
      ),
    );
  }
}