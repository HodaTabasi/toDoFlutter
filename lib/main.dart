import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/todoApp/Constent/Contest.dart';
import 'package:flutter_app3/todoApp/main_page.dart';
import 'package:flutter_app3/todoApp/navigation/page1.dart';
import 'package:flutter_app3/todoApp/navigation/page2.dart';
import 'package:flutter_app3/todoApp/navigation/page3.dart';

void main() {
  runApp(MaterialApp(home: MainPage()));
  // runApp(MaterialApp(home: Page1()
  // ,routes: {
  //   Page1.routeName:(context)=>Page1(),
  //   Page2.routeName:(context)=>Page2('',''),
  //   Page3.routeName:(context)=>Page3(),
  //   },));

  // runApp(MaterialApp(
  //   initialRoute: Page1.routeName,
  //   routes: {...Contstant.map},
  // ));
}

class MyApp extends StatelessWidget {
  String textValue = 'hello world';
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  print('object');
                },
                child: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 26.0,
                ),
              )
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text(textValue)),
                CupertinoSwitch(
                    value: switchValue,
                    onChanged: (value) {
                      print(value);
                    })
              ],
            ),
          ],
        ),
      ),
    );
    // return
    // Scaffold(
    //     appBar: AppBar(
    //       title: Text('Products'),
    //     ),
    //     body: Column(
    //       children: [
    //         Text('Products'),
    //         Expanded(
    //           child: GridView.builder(
    //               gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //                   maxCrossAxisExtent: 200),
    //               //  SliverGridDelegateWithFixedCrossAxisCount(
    //               //   crossAxisCount: 3,
    //               //   mainAxisSpacing: 10,
    //               //   crossAxisSpacing: 10,
    //               // ),
    //               itemCount: products.length,
    //               itemBuilder: (c, index) {
    //                 return CachedNetworkImage(
    //                   imageUrl: products[index].imageUrl,
    //                   fit: BoxFit.cover,
    //                   placeholder: (c, y) {
    //                     return Center(
    //                       child: CircularProgressIndicator(),
    //                     );
    //                   },
    //                 );
    //               }),
    //         ),
    //       ],
    //     ));
  }
}

// class Page2 extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return OmarState();
//   }
// }

// class OmarState extends State<Page2> {
//   String value = 'Hello World';
//   bool switchValue = false;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(20),
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: Text(
//                     switchValue ? 'DAY TIME' : 'NIGHT TIME',
//                     style: TextStyle(fontSize: 20),
//                   )),
//                   CupertinoSwitch(
//                       value: switchValue,
//                       onChanged: (value) {
//                         switchValue = value;
//                         setState(() {});
//                       })
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class Page2 extends StatefulWidget {
//   @override
//   _Page2State createState() => _Page2State();
// }

// class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
//   TabController tabController;

//   myMethod() {
//     tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   initState() {
//     super.initState();
//     myMethod();
//   }

//   int index = 0;
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Application'),
//         bottom: TabBar(controller: tabController, tabs: [
//           Tab(
//             child: Text('Home'),
//           ),
//           Tab(
//             child: Text('Studio'),
//           ),
//           Tab(
//             child: Text('Profile'),
//           ),
//         ]),
//       ),
//       body: TabBarView(controller: tabController, children: [
//         Center(
//           child: RaisedButton(
//               child: Text('Go to my profile'),
//               onPressed: () {
//                 tabController.animateTo(2);
//               }),
//         ),
//         Center(
//           child: Text('Studio'),
//         ),
//         Center(
//           child: Text('Profile'),
//         ),
//       ]),
//       bottomNavigationBar: BottomNavigationBar(
//           onTap: (index) {
//             print(index);
//             tabController.animateTo(index);

//             this.index = index;
//             setState(() {});
//           },
//           currentIndex: index,
//           fixedColor: Colors.blue,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Gallery'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.verified_user), label: 'Profile'),
//           ]),
//     );
//   }
// }
