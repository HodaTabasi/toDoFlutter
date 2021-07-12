import 'package:flutter_app3/todoApp/navigation/page1.dart';
import 'package:flutter_app3/todoApp/navigation/page2.dart';
import 'package:flutter_app3/todoApp/navigation/page3.dart';

class Contstant {
  static final Map map = {
    Page1.routeName:(context)=>Page1(),
    Page2.routeName:(context)=>Page2('',''),
    Page3.routeName:(context)=>Page3(),
  };
}