import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/constants/singleton/UserSingleton.dart';
import 'package:invoice/models/chartModel.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/view_model/home_cubit.dart';
import 'package:invoice/view_model/home_state.dart';
import 'package:invoice/views/home_layout/item_screen/item_widgets.dart';
import 'package:invoice/views/setting/settings.dart';
import 'package:invoice/views/widgets/widgets.dart';

import '../item_screen/view_item_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<ChartData> data = [
    ChartData(month: 'Sat', value: 0),
    ChartData(month: 'Sun', value: 0),
    ChartData(month: 'Mon', value: 0),
    ChartData(month: 'Tus', value: 0),
    ChartData(month: 'Wed', value: 0),
    ChartData(month: 'Thurs', value: 0),
    ChartData(month: 'Fri', value: 0),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartData, String>> series = [
      charts.Series(
        id: "Subscribers",
        data: data,
        domainFn: (ChartData series, _) => series.month.toString(),
        measureFn: (ChartData series, _) => series.value,
        //colorFn: (ChartData series, _) => Colors.green
      )
    ];
    return SizedBox.expand(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetProductsStateLoading ||
              state is GetClientsStateLoading ||
              state is GetInvoicesStateLoading &&
                  HomeCubit.get(context).productsResponse == null) {
            return loading();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning,',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Color(0x5015141F),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              UserSingleton().user!.firstName!,
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  color: Color(0xff15141F),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
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
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 239.w,
                          height: 36.h,
                          //color: Colors.grey,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: Color(0xfff5f7f3), width: 1.5.w),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 69.w,
                                height: 28.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Color(0xff31CB47)),
                                child: Center(
                                  child: Text(
                                    'Invoice',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: 69.w,
                                height: 28.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.transparent),
                                child: Center(
                                  child: Text(
                                    'Product',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff8B8B8B)),
                                  ),
                                ),
                              ),
                              Container(
                                width: 69.w,
                                height: 28.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.transparent),
                                child: Center(
                                  child: Text(
                                    'Client',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff8B8B8B)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search,
                              size: 30.sp, color: Color(0xff002D84))),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 93.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff002D84),
                          ),
                          child: Center(
                            child: Text(
                              'Week',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: 93.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              'Month',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          width: 93.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              'Year',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 200,
                          child: charts.BarChart(
                            series,
                            animate: true,
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
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Top Selling Products',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      )),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4263EB),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              AppNavigator.pushTo(
                                  context: context,
                                  widget: ViewItemScreen(HomeCubit.get(context)
                                      .productsResponse!
                                      .product![index]));
                            },
                            child: buildProductItem(HomeCubit.get(context)
                                .productsResponse!
                                .product![index]),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 5.h,
                          ),
                      itemCount: HomeCubit.get(context).productsResponse == null
                          ? 0
                          : HomeCubit.get(context).productsResponse!.number!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
