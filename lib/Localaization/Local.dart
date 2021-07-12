import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class LocalPage extends StatelessWidget {
  // const LocalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: translator.currentLanguage == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                  onTap: () {
                    translator.setNewLanguage(
                      context,
                      newLanguage:
                          translator.currentLanguage == 'ar' ? 'en' : 'ar',
                      remember: true,
                      restart: true,
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(translator.translate('buttonTitle'))))
            ],
            title: Text(translator.translate('appTitle')),
          ),
          body: Column(
            children: [
              Text(translator.translate('appTitle')),
              Text(translator.translate('googleTest')),
              Text(translator.translate('textArea')),
            ],
          ),
        ));
  }
}
