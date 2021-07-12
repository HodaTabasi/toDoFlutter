// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_app3/LocalStorage/add_data_to_shared.dart';
// import 'package:flutter_app3/LocalStorage/sp_helper.dart';
//
// class Splach extends StatefulWidget {
//   @override
//   _SplachState createState() => _SplachState();
// }
//
// class _SplachState extends State<Splach> {
//
//   @override
//   Future<void> initState() async {
//     // TODO: implement initState
//     super.initState();
//     SPHelper.getInstance().initSP();
//     bool result = SPHelper.getInstance().checkFirstTime();
//     await Future.delayed(Duration(seconds: 3));
//     result ? AddDataToShared("old"): AddDataToShared("new");
//   }
//   @override
//   Widget build(BuildContext context) {\
//
//     return Scaffold(
//       body: Container(
//         width: 300,
//         height: 300,
//         child: FlutterLogo(),
//         // child: Image.asset("assets/images/image.jpg"),
//       ),
//     );
//   }
// }
