import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice/constants/assets.dart';
import 'package:invoice/constants/singleton/UserSingleton.dart';
import 'package:invoice/models/TabItemModel.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/view_model/home_cubit.dart';
import 'package:invoice/views/home_layout/client_screen/add_client_screen.dart';
import 'package:invoice/views/home_layout/client_screen/client_screen.dart';
import 'package:invoice/views/home_layout/home_screen/home_screen.dart';
import 'package:invoice/views/home_layout/invoice_screen/add_invoice_screen.dart';
import 'package:invoice/views/home_layout/invoice_screen/invoice_screen.dart';
import 'package:invoice/views/home_layout/item_screen/add_item_screen.dart';
import 'package:invoice/views/home_layout/item_screen/item_screen.dart';

class HomeLayout extends StatefulWidget {
  //const HomeLayout({Key? key}) : super(key: key);
  final int pageIndex;

  HomeLayout({this.pageIndex = 0});

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isOpened = false;
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  // late AnimationController _animationController;
  // late Animation<Color?> _buttonColor;
  // late Animation<double> _animateIcon;
  // late Animation<double> _translateButton;
  // Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  List<TabItemModel> tabs = [];

  List<Widget> screens = [
    HomeScreen(),
    InvoiceScreen(),
    ItemScreen(),
    ClientScreen(),
  ];

  late int _currentIndex = widget.pageIndex;

  @override
  initState() {
    _tabController = TabController(
      initialIndex: _currentIndex,
      length: screens.length,
      vsync: this,
    );
    // _animationController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 500))
    //       ..addListener(() {
    //         setState(() {});
    //       });
    // _animateIcon =
    //     Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    // _buttonColor = ColorTween(
    //   begin: Colors.blue,
    //   end: Colors.red,
    // ).animate(CurvedAnimation(
    //   parent: _animationController,
    //   curve: Interval(
    //     0.00,
    //     1.00,
    //     curve: Curves.linear,
    //   ),
    // ));
    // _translateButton = Tween<double>(
    //   begin: _fabHeight,
    //   end: -14.0,
    // ).animate(CurvedAnimation(
    //   parent: _animationController,
    //   curve: Interval(
    //     0.0,
    //     0.75,
    //     curve: _curve,
    //   ),
    // ));
    super.initState();
  }

  @override
  dispose() {
    // _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      //_animationController.forward();
    } else {
      //_animationController.reverse();
    }
    isOpened = !isOpened;
  }

  // Widget invoice() {
  //   return Container(
  //     child: FloatingActionButton(
  //       onPressed: (){
  //         setState(() {
  //           isOpened = !isOpened;
  //           _animationController.reverse();
  //         });
  //         AppNavigator.pushTo(context: context, widget: AddInvoiceScreen());
  //       },
  //       tooltip: 'Invoice',
  //       child: Icon(Icons.inventory_outlined),
  //     ),
  //   );
  // }
  //
  // Widget client() {
  //   return Container(
  //     child: FloatingActionButton(
  //       onPressed: (){
  //         setState(() {
  //           isOpened = !isOpened;
  //           _animationController.reverse();
  //         });
  //         AppNavigator.pushTo(context: context, widget: AddClientScreen());
  //       },
  //       tooltip: 'Client',
  //       child: Icon(Icons.person_outline),
  //     ),
  //   );
  // }
  //
  // Widget item() {
  //   return Container(
  //     child: FloatingActionButton(
  //       onPressed: (){
  //         setState(() {
  //           isOpened = !isOpened;
  //           _animationController.reverse();
  //         });
  //         AppNavigator.pushTo(context: context, widget: AddItemScreen());
  //       },
  //       tooltip: 'Item',
  //       child: Icon(Icons.badge_outlined),
  //     ),
  //   );
  // }
  //
  // Widget toggle() {
  //   return Container(
  //     child: FloatingActionButton(
  //       backgroundColor: _buttonColor.value,
  //       onPressed: animate,
  //       tooltip: 'Toggle',
  //       child: Icon(
  //         isOpened ? Icons.close : Icons.add,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      Languages.of(context)!.kHome,
      Languages.of(context)!.kInvoice,
      Languages.of(context)!.kItem,
      Languages.of(context)!.kClient,
    ];
    tabs = [
      TabItemModel(
        asset: Assets.HOME,
        title: Languages.of(context)!.kHome,
      ),
      TabItemModel(
        asset: Assets.CHART,
        title: Languages.of(context)!.kInvoice,
      ),
      TabItemModel(
        asset: Assets.ITEM,
        title: Languages.of(context)!.kItem,
      ),
      TabItemModel(
        asset: Assets.USER,
        title: Languages.of(context)!.kClient,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit()
          ..getProducts(id: UserSingleton().user!.company!.id.toString())
          ..getClients(id: UserSingleton().user!.company!.id.toString())
          ..getInvoices(),
        child: SafeArea(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: screens,
          ),
        ),
      ),
      //Stack(
      //alignment: AlignmentDirectional.bottomEnd,
      //children: [
      //screens[_currentIndex],
      // Positioned(
      //   bottom: 20,
      //   left: LanguageHelper.isEnglish ? null :  20,
      //   right: LanguageHelper.isEnglish ? 20 : null,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: <Widget>[
      //       Transform(
      //         transform: Matrix4.translationValues(
      //           0.0,
      //           _translateButton.value * 3.0,
      //           0.0,
      //         ),
      //         child: invoice(),
      //       ),
      //       Transform(
      //         transform: Matrix4.translationValues(
      //           0.0,
      //           _translateButton.value * 2.0,
      //           0.0,
      //         ),
      //         child: client(),
      //       ),
      //       Transform(
      //         transform: Matrix4.translationValues(
      //           0.0,
      //           _translateButton.value,
      //           0.0,
      //         ),
      //         child: item(),
      //       ),
      //       toggle(),
      //     ],
      //   ),
      // ),
      //],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        //animatedIcon: AnimatedIcons.add_event,
        icon: Icons.add,
        openCloseDial: isDialOpen,
        backgroundColor: Color(0xff002D84),
        overlayColor: Colors.transparent,
        overlayOpacity: .5,
        spacing: 15,
        spaceBetweenChildren: 15,
        closeManually: true,
        children: [
          SpeedDialChild(
              child: SvgPicture.asset(
                Assets.CHART,
                color: Color(0xff002D84),
              ),
              label: 'Add invoice',
              //backgroundColor: Colors.blue,
              onTap: () {
                isDialOpen.value = false;
                AppNavigator.pushTo(
                    context: context, widget: AddInvoiceScreen());
              }),
          SpeedDialChild(
              child: SvgPicture.asset(Assets.ITEM, color: Color(0xff002D84)),
              label: 'Add item',
              onTap: () {
                isDialOpen.value = false;
                AppNavigator.pushTo(context: context, widget: AddItemScreen());
              }),
          SpeedDialChild(
              child: SvgPicture.asset(Assets.USER, color: Color(0xff002D84)),
              label: 'Add Client',
              onTap: () {
                isDialOpen.value = false;
                AppNavigator.pushTo(
                    context: context, widget: AddClientScreen());
              }),
          // add multiple SpeedDialChild
        ],
      ),
      // FloatingActionButton(
      //   backgroundColor: Color(0xff002D84),
      //   onPressed: (){
      //     AppNavigator.pushTo(context: context, widget: AddClientScreen());
      //   },
      //   child: Icon(Icons.add, color: Colors.white),
      // ),
      bottomNavigationBar: _bottomNavigationBar(),
      // BottomNavigationBar(
      //   items: [
      //      BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: Languages.of(context)!.kHome),
      //      BottomNavigationBarItem(icon: Icon(Icons.inventory_outlined),label: Languages.of(context)!.kInvoice),
      //      BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: Languages.of(context)!.kClient),
      //      BottomNavigationBarItem(icon: Icon(Icons.badge_outlined),label: Languages.of(context)!.kItem),
      //   ],
      //   currentIndex: _currentIndex,
      //       onTap: (index) {
      //         setState(() {
      //           _currentIndex = index;
      //         });
      //       },
      // ),
    );
  }

  Widget _bottomNavigationBar() {
    return AnimatedBottomNavigationBar.builder(
      height: 60,
      rightCornerRadius: 18,
      leftCornerRadius: 18,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      splashColor: Theme.of(context).splashColor,
      activeIndex: _tabController.index,
      onTap: (index) => setState(() => _tabController.animateTo(index)),
      itemCount: tabs.length,
      tabBuilder: (index, isActive) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              tabs[index].asset,
              width: 20.sp,
              height: 20.h,
              color: isActive ? Color(0xff002D84) : Color(0xffACBBF3),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              tabs[index].title,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? Color(0xff002D84) : Color(0xffACBBF3),
              ),
            ),
          ],
        );
      },
    );
  }
}
