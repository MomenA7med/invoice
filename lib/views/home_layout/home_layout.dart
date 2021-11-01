
import 'package:flutter/material.dart';
import 'package:invoice/utils/Localization/LanguageHelper.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';
import 'package:invoice/utils/Navigator.dart';
import 'package:invoice/views/home_layout/client_screen/add_client_screen.dart';
import 'package:invoice/views/home_layout/client_screen/client_screen.dart';
import 'package:invoice/views/home_layout/home_screen/home_screen.dart';
import 'package:invoice/views/home_layout/invoice_screen/add_invoice_screen.dart';
import 'package:invoice/views/home_layout/invoice_screen/invoice_screen.dart';
import 'package:invoice/views/home_layout/item_screen/add_item_screen.dart';
import 'package:invoice/views/home_layout/item_screen/item_screen.dart';
import 'package:invoice/views/search_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({ Key? key }) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with SingleTickerProviderStateMixin{

  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<Color?> _buttonColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  
  List<Widget> screens = [
    HomeScreen(),
    InvoiceScreen(),
    ClientScreen(),
    ItemScreen(),
  ];
  int _currentIndex = 0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget invoice() {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          setState(() {
            isOpened = !isOpened;
            _animationController.reverse();
          });
          AppNavigator.pushTo(context: context, widget: AddInvoiceScreen());
        },
        tooltip: 'Invoice',
        child: Icon(Icons.inventory_outlined),
      ),
    );
  }

  Widget client() {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          setState(() {
            isOpened = !isOpened;
            _animationController.reverse();
          });
          AppNavigator.pushTo(context: context, widget: AddClientScreen());
        },
        tooltip: 'Client',
        child: Icon(Icons.person_outline),
      ),
    );
  }

  Widget item() {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          setState(() {
            isOpened = !isOpened;
            _animationController.reverse();
          });
          AppNavigator.pushTo(context: context, widget: AddItemScreen());
        },
        tooltip: 'Item',
        child: Icon(Icons.badge_outlined),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: Icon(
          isOpened ? Icons.close : Icons.add,
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    List<String> titles =[
      Languages.of(context)!.kHome,
      Languages.of(context)!.kInvoice,
      Languages.of(context)!.kClient,
      Languages.of(context)!.kItem,
  ];
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(titles[_currentIndex]),),
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            AppNavigator.pushTo(context: context, widget: SearchScreen());
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          screens[_currentIndex],
          Positioned(
            bottom: 20,
            left: LanguageHelper.isEnglish ? null :  20,
            right: LanguageHelper.isEnglish ? 20 : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Transform(
                  transform: Matrix4.translationValues(
                    0.0,
                    _translateButton.value * 3.0,
                    0.0,
                  ),
                  child: invoice(),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                    0.0,
                    _translateButton.value * 2.0,
                    0.0,
                  ),
                  child: client(),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                    0.0,
                    _translateButton.value,
                    0.0,
                  ),
                  child: item(),
                ),
                toggle(),
              ],
            ),
          ),
        ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
           BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: Languages.of(context)!.kHome),
           BottomNavigationBarItem(icon: Icon(Icons.inventory_outlined),label: Languages.of(context)!.kInvoice),
           BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: Languages.of(context)!.kClient),
           BottomNavigationBarItem(icon: Icon(Icons.badge_outlined),label: Languages.of(context)!.kItem),
        ],
        currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
      ),
    );
  }
}