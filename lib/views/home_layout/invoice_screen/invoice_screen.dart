import 'package:flutter/material.dart';
import 'package:invoice/views/home_layout/home_screen/home_widget.dart';
import 'package:invoice/views/home_layout/invoice_screen/invoice_widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({ Key? key }) : super(key: key);

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  int choose = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ToggleSwitch(
                totalSwitches: 2,
                activeBgColors: [[Colors.red],[Colors.blue]],
                activeFgColor: Colors.white,
                minWidth: 150.0,
                cornerRadius: 20.0,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                labels: ['Invoices','quotations'],
                onToggle: (index){
                  setState(() {
                    choose = index;
                  });
                },
                animate: true,
                fontSize: 20,
                initialLabelIndex: choose,
              ),
              SizedBox(height: 20,),
              buildInvoiceItem('اسم العميل','رقم الفاتورة','التاريخ','الكمية'),
              SizedBox(height: 10,),
              buildInvoiceItem('اسم العميل','رقم الفاتورة','التاريخ','الكمية'),
              SizedBox(height: 10,),
              buildInvoiceItem('اسم العميل','رقم الفاتورة','التاريخ','الكمية'),
              SizedBox(height: 10,),
              buildInvoiceItem('اسم العميل','رقم الفاتورة','التاريخ','الكمية'), 
            ],
          ),
        ),
      ),
    );
  }
}