import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'lang/LanguageHelper.dart';
import 'screen/HomeScreen.dart';

class NBApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NBState();
  }
}

class NBState extends State<NBApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        LanguageDelegate(["en","zh"]),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        ///if you do not know about country code ,you can see this: https://www.mobilefish.com/tutorials/country_language_codes/countrylanguagecodes.html
        const Locale("en", "US"),
        const Locale("zh", "CN"),
      ],
      title: "Titleeeeeeeeeeeeeeeeeee",
      home: HomeScreen(),
    );
  }
}
