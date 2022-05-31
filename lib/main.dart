import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/constants/singleton/UserSingleton.dart';
import 'package:invoice/intro/splash_screen.dart';
import 'package:invoice/intro/welcome_screen.dart';
import 'package:invoice/utils/Localization/LanguageHelper.dart';
import 'package:invoice/views/home_layout/home_layout.dart';
import 'package:invoice/views/setting/change_language.dart';
import 'package:invoice/views/setting/vat_screen.dart';

import 'constants/constants.dart';
import 'utils/Localization/AppLocalizationsDelegate.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserSingleton().initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    UserSingleton().getStoredUser();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    LanguageHelper.getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),
      builder:() => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.kAppName,
        theme: kLightTheme,
        home: SplashScreen(),
        locale: _locale,
        supportedLocales: supportedLocales,
        localizationsDelegates: localizationsDelegates,
        localeResolutionCallback: localeResolutionCallback,
      ),
    );
  }


}

extension Localization on _MyAppState {
  Iterable<Locale> get supportedLocales => [
        Locale(Strings.kEnglishLanguageCode, ''),
        Locale(Strings.kArabicLanguageCode, ''),
      ];

  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  LocaleResolutionCallback get localeResolutionCallback =>
      (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      };
}
