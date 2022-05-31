import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/view_model/home_cubit.dart';
import 'package:invoice/view_model/home_state.dart';
import 'package:invoice/views/home_layout/invoice_screen/invoice_widgets.dart';
import 'package:invoice/views/setting/settings.dart';
import 'package:invoice/views/widgets/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  int choose = 0;
  Map<String, double> dataMap = {
    "Flutter": 0,
    "React": 0,
    "Xamarin": 0,
    "Ionic": 0,
  };
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetProductsStateLoading ||
            state is GetClientsStateLoading ||
            state is GetInvoicesStateLoading ||
            HomeCubit.get(context).invoicesResponse == null) {
          return loading();
        }
        return SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color(0xff15141F),
                            size: 25.sp,
                          )),
                      Expanded(
                          child: Center(
                              child: Text(
                        'Invoice',
                        style: TextStyle(
                          color: Color(0xff15141F),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ))),
                      InkWell(
                          onTap: () {
                            AppNavigator.pushTo(
                                context: context, widget: Settings());
                          },
                          child: SvgPicture.asset(Assets.SETTINGS,
                              width: 20.w, height: 19.h)),
                      SizedBox(
                        width: 10.w,
                      ),
                      CircleAvatar(
                        radius: 15.sp,
                        backgroundImage: NetworkImage(
                            'https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/245387722_3866330600172489_970207518439149275_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeERVVGM6UY_r42AVqH2KDO65FeW6HHO7Q_kV5bocc7tD5C6sajvE-sX_4CPc8PW2Qe6I95pg9MzqVdtYMd6to-o&_nc_ohc=1x2Ak1BerY0AX-Zkpy3&_nc_ht=scontent.fcai19-4.fna&oh=00_AT-DqBNRbXI0Iq7odBomASr1pUo97EleOZ5gMxS70KKCPA&oe=61C4E43C'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 147.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Color(0xff31CB47),
                        ),
                        child: Center(
                          child: Text(
                            'Invoice',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 147.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Color(0xffF9F9FA),
                        ),
                        child: Center(
                          child: Text(
                            'Quotation',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Today’s Sales',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              size: 25.sp,
                            ))
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 200,
                          child: PieChart(
                            dataMap: dataMap,
                            animationDuration: Duration(milliseconds: 1000),
                            chartLegendSpacing: 50,
                            chartRadius: 150,
                            colorList: [
                              Colors.red,
                              Colors.black,
                              Colors.green,
                              Colors.blue
                            ],
                            initialAngleInDegree: 10,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 20,
                            //centerText: "\$691.54",
                            legendOptions: LegendOptions(
                              showLegendsInRow: true,
                              legendPosition: LegendPosition.bottom,
                              showLegends: false,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: false,
                              showChartValues: false,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 1,
                            ),
                            // gradientList: ---To add gradient colors---
                            // emptyColorGradient: ---Empty Color gradient---
                          )),
                      Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey.withOpacity(.4),
                          child: Center(
                            child: SvgPicture.asset(
                              Assets.LOCK,
                              width: 50.w,
                              height: 50.h,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'All invoices',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '(${HomeCubit.get(context).invoicesResponse!.number!})',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildInvoicItem(
                          HomeCubit.get(context)
                              .invoicesResponse!
                              .items![index],
                          context),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 5.h,
                          ),
                      itemCount:
                          HomeCubit.get(context).invoicesResponse!.number!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
