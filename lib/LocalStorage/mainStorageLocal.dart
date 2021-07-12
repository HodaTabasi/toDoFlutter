import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/LocalStorage/add_data_to_shared.dart';
import 'package:flutter_app3/LocalStorage/sp_helper.dart';
import 'package:flutter_app3/todoApp/Constent/Contest.dart';
import 'package:flutter_app3/todoApp/main_page.dart';
import 'package:flutter_app3/todoApp/navigation/page1.dart';
import 'package:flutter_app3/todoApp/navigation/page2.dart';
import 'package:flutter_app3/todoApp/navigation/page3.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPHelper.sp.initSP();
  runApp(MaterialApp(home: AddDataToShared("ffffffff")));
}