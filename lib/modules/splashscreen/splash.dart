import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:design_ui/constant/colors.dart';

import 'package:flutter/material.dart';

import '../on boarding/on boarding.dart';

class spalshscreen extends StatelessWidget {
  const spalshscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      animationDuration:const Duration(seconds: 3),
      splashIconSize: 600,

      splash:
      Column(
        children: [
          Expanded(child: Container(
            child: Image.asset(
              'assets/image/qualitylogo.jpg' ,
            ),
          ))
     ,
          Container(
            child:const Text('quality Management System ',style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.black),) ,)
        ],
      ),
      nextScreen: onBoardingScrean(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
    );
  }
}
