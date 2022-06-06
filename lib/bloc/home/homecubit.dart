import 'dart:convert';

import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/models/modelMaktba.dart';
import 'package:design_ui/models/yearsmodel.dart';
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


  int currnetindextabbar = 0;
  List<Widget> screentabbar = [
    Homeoverview(),
    Homecharts(),
    TablesHome(),
    TablesHome(),
    TablesHome(),
    TablesHome(),
    TablesHome(),
  ];

  void Homechangetapappbar(int index) {
    currnetindextabbar = index;
    emit(qualitytapappbarstate());
  }

  void Staffchangetapappbar(int index) {
    currnetindextabbar = index;
    emit(qualitytStaffapappbarstate());
  }


  // Library?modellibrary;
  //  GetLibrary()  {
  //   emit(qualitydataloadingstate());
  //     http.get(Uri.parse('https://qms-application.herokuapp.com/api/libraries?populate=deep,2')).
  //    then((response)
  //   {
  //     if(response.statusCode==200)
  //     {
  //
  //       print(response.body);
  //       modellibrary =Library.fromJson(jsonDecode(response.body)) ;
  //       emit(qualitydatasuccessstate());
  //
  //       return modellibrary;
  //     }
  //     else
  //     {
  //
  //       throw Exception('failed to get library data');
  //     }
  //   }).catchError((error)
  //   {
  //     emit(qualitydataerrorstate(error));
  //     print(error.toString());
  //
  //   });
  //
  //
  // }

  // Future<Library> PostLibrary({int? num, int? idyear, int? idbook}) async {
  //   emit(qualitypostlibraryloadingstate());
  //
  //   dynamic api = 'https://qms-application.herokuapp.com/api/libraries?populate=deep,2';
  //
  //   final response = await http.post((Uri.parse(api)), headers:<String , String> {
  //     //'Authorization' : 'xyz',
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  //       body: jsonEncode(<dynamic,dynamic>{
  //
  //         "data":{
  //           "Number":num,
  //           "academic_year":{
  //             "id":idyear
  //           },
  //           "book_type":{
  //             "id":idbook
  //           }
  //         }
  //       })
  //   );
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body.toString());
  //     print(data);
  //     emit(qualitypostlibrarysuccessstate());
  //
  //     return Library.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to post library.');
  //   }
  // }

}
