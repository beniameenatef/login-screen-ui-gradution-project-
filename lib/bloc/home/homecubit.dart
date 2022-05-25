import 'dart:convert';

import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/modules/ScreenNavigationBar/Home/ScreensHome/charts.dart';
import 'package:design_ui/modules/ScreenNavigationBar/Home/ScreensHome/overview.dart';
import 'package:design_ui/modules/ScreenNavigationBar/Home/ScreensHome/tables.dart';
import 'package:design_ui/modules/ScreenNavigationBar/feedback.dart';
import 'package:design_ui/modules/ScreenNavigationBar/Home/home.dart';
import 'package:design_ui/modules/ScreenNavigationBar/profile.dart';
import 'package:design_ui/modules/ScreenNavigationBar/setting.dart';




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'package:http/http.dart' as http;

class homecubit extends Cubit<qualityhomestates> {
  homecubit() : super(qualityhomeInitialState());

  static homecubit get(context) => BlocProvider.of(context);


  int currentindexnavbar = 0;

  List<Widget> screenNavigationbar = [
    homescreen(),
    feedback(),
    profile(),
    setting(),
  ];

  void changebottomnavifationbar(int index) {
    currentindexnavbar = index;
    emit(qualitynavigationbarstate());
  }

  int currnetindextabbar=0;
  List<Widget> screentabbar = [
    Homeoverview(),
    Homecharts(),
    TablesHome(),
  ];

  void Homechangetapappbar(int index) {
    currnetindextabbar = index;
    emit(qualitytapappbarstate());
  }

// Year?model;
//
// Future<Year> GetYears()async  {
//   emit(qualitydataloadingstate());
//    model=await http.get(
//       Uri.parse('https://qms-application.herokuapp.com/api/academic-years?populate=deep,4')).
//   then((value)
//   {
//     if(value.statusCode==200){
//
//       print(value.body);
//       return Year.fromJson(jsonDecode(value.body));
//
//     }
//     else
//     {
//       throw Exception('failed to get data');
//     }
//
//   }).catchError((error){
//     emit(qualitydataerrorstate(error.toString()));
//     print(error);
//
//   });
//
// }
  }




