import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'lang/LanguageHelper.dart';

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
class HomeScreen extends StatefulWidget {
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        LanguageHelper.value(context, 'enter_code_label'),
      ),
    );
  }
}

class Translation {
  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  Translation(Locale loc) {
    this.locale = loc;
    _localizedValues = null;
  }

  static String value(BuildContext context, String key) {
    return Localizations.of<Translation>(context, Translation)._value(key);
  }

  static Future<Translation> load(Locale locale) async {
    Translation translations = new Translation(locale);
    String jsonContent =
        await rootBundle.loadString("locale/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  String _value(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  get currentLanguage => locale.languageCode;

  void test() {}
}

class NBTranslationDelegate extends LocalizationsDelegate<Translation> {
  const NBTranslationDelegate();

  @override
  bool isSupported(Locale locale) => ["en", "zh"].contains(locale.languageCode);

  @override
  Future<Translation> load(Locale locale) {
    return Translation.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<Translation> old) => false;
}
