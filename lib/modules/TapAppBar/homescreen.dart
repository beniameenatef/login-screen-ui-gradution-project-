import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:flutter/material.dart';

class CategoryHome extends StatefulWidget {
  @override
  State createState() {
    return _CategoryHomeState();
  }
}

class _CategoryHomeState extends State {
  @override
  int currentIndex = 0;

  final List children = [
    detailshomePage(),
    detailshomePage(),
    detailshomePage(),
    detailshomePage(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(

      body: children[currentIndex],

    );
  }

// void onTabTapped(int index) {
//   Widget page = Home();
//   // switch (index) {
//   //   case 1:
//   //     page = Profile();
//   //     break;
//   //
//   // }
//   Navigator.of(context).push(
//     MaterialPageRoute(builder: (context) => page),
//   );
//   // setState(() {
//   //   _currentIndex = index;
//   //   print(index);
//   // });
// }
}
