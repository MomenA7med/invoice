import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/view_model/home_cubit.dart';
import 'package:invoice/view_model/home_state.dart';
import 'package:invoice/views/home_layout/client_screen/client_widget.dart';
import 'package:invoice/views/home_layout/client_screen/view_client_screen.dart';
import 'package:invoice/views/setting/settings.dart';
import 'package:invoice/views/widgets/widgets.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetProductsStateLoading ||
                state is GetClientsStateLoading ||
                state is GetInvoicesStateLoading) {
              return loading();
            }
            return SingleChildScrollView(
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
                          'Client',
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
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Total Clients',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    if (HomeCubit.get(context).clientsResponse != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${HomeCubit.get(context).clientsResponse!.number ?? 0} Clients',
                              style: TextStyle(
                                  fontSize: 23.sp, fontWeight: FontWeight.w800),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  size: 25.sp,
                                ))
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 10.h,
                    ),
                    if (HomeCubit.get(context).clientsResponse != null)
                      ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  AppNavigator.pushTo(
                                      context: context,
                                      widget: ViewClientScreen(
                                        HomeCubit.get(context)
                                            .clientsResponse!
                                            .items![index],
                                      ));
                                },
                                child: buildItemClient(HomeCubit.get(context)
                                    .clientsResponse!
                                    .items![index]),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 5.h,
                              ),
                          itemCount: HomeCubit.get(context)
                              .clientsResponse!
                              .items!
                              .length),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
