part of 'constants.dart';

final ThemeData kLightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Colors.blue,
  splashColor: kSplashColor,
  accentColor: Colors.blueAccent,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            elevation: 20.0,
            backgroundColor: Colors.white,
          ),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
      ), 
    ),
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 2.0,
  ),
);
