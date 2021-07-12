import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/Localaization/Local.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/langs/',
  );
  runApp(
    LocalizedApp(
        child: MaterialApp(
      home: LocalPage(),
      localizationsDelegates: translator.delegates,
      // Android + iOS Delegates
      locale: translator.locale,
      // Active locale
      supportedLocales: translator.locals(),
    )),
  );
}
