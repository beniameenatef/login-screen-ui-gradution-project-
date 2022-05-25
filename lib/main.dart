import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/dio%20helper.dart';
import 'package:design_ui/bloc/home/homecubit.dart';

import 'package:design_ui/shared/shared%20preference.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await cachehelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => homecubit(),
          ),
          // BlocProvider<BlocB>(
          //   create: (BuildContext context) => BlocB(),
          // ),
          // BlocProvider<BlocC>(
          //   create: (BuildContext context) => BlocC(),
          // ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            backgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          home:
          // years(),
          AppDrawer(child:detailshomePage()),
        ));
  }
}




