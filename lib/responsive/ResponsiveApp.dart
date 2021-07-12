import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/responsive/LandScapePage.dart';

import 'PortraitPage.dart';

class ResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape  ? LandSacpe() : Poratrait();
  }
}
