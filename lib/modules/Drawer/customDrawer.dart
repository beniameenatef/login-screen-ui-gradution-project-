import 'package:design_ui/constant/colors.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%A7%D8%A8%D8%AD%D8%A7%D8%AB.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%A8%D8%B1%D8%AA%D9%88%D9%83%D9%88%D9%84.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%B9%D8%A7%D9%85%20%D8%A7%D9%84%D8%A7%D9%83%D8%A7%D8%AF%D9%8A%D9%85%D9%8A.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D9%85%D9%83%D8%AA%D8%A8%D8%A9.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%AA%D8%AE%D8%B5%D8%B5%20%D8%A7%D9%84%D8%A7%D8%A8%D8%AD%D8%A7%D8%AB.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%B9%D9%86%D8%A7%D8%B5%D8%B1%20%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D9%85%D8%B9%D8%A7%D9%85%D9%84%D8%A7%D8%AA%20%D8%A7%D9%84%D8%B7%D9%84%D8%A7%D8%A8.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D9%86%D8%B4%D8%A7%D8%B7%20%D8%A7%D9%84%D8%B7%D9%84%D8%A7%D8%A8.dart';
import 'package:design_ui/modules/login/userdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ScreenPageDrawer/اعداد الخريجين.dart';
import '../ScreenPageDrawer/الاقسام.dart';
import '../ScreenPageDrawer/العمال الاداريين.dart';
import '../ScreenPageDrawer/العمال الاكادميين .dart';
import '../ScreenPageDrawer/المعامل.dart';
import '../ScreenPageDrawer/انواع الكتب.dart';
import '../ScreenPageDrawer/توزيع الطلاب.dart';
import '../ScreenPageDrawer/نوع البرتوكول.dart';

class CustomDrawer extends StatelessWidget {
  bool obserText = true;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async => false,
        child:Material(
      color: Color(0xFF054978),
      child: SafeArea(
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
          ),
          child: Padding(padding: EdgeInsetsDirectional.only(start: 20,bottom: 40,end: 100),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,


                    children:
                     [
                      Padding(padding: EdgeInsetsDirectional.only(
                           start: 10,top: 70),
                        //     child:CircleAvatar(
                      //   radius: 30,
                      //
                      // ),
                     ),
                      SizedBox(height: 10,),
                       Text('Welcome!',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.orange,fontSize: 20),),
                       Text(username.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.orange,fontSize: 20),),
                      SizedBox(height: 5,),
                      // Text('${email}',style:
                      // TextStyle(fontWeight: FontWeight.bold,color: AppColors.orange),),

                    ],),
                  SizedBox(height: 20,),
                  Container(
                      width: 400,
                      height: 1,
                      child:   Divider(
                          color: Color(0xfff4f4f8),
                        ),

                  ),
                  SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      //MyStatefulWidget();

                      Navigator.push(context, MaterialPageRoute(
                          builder:(context)=>Al3am_Alacademy()));
                    },
                    child: Row( children: const [
                      Text('العام الاكاديمي ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      // MyAppp(),
                    ],),),
                  SizedBox(height: 15,),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AL3omal(),
                        ),
                      );

                    },
                    child: Row(
                      children: const [
                      Text('اعضاء هيئة التدريس',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => El3omalelEdareen(),
                        ),
                      );

                    },
                    child: Row(
                      children: const [
                        Text(' الاداريين',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      ],),),
                  SizedBox(height: 15,),


                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Alma3amel(),
                        ),
                      );

                    },
                    child: Row( children: [
                      Text('المعامل ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tawzee3Altolap(),
                        ),
                      );

                    },
                    child: Row( children: [
                      Text('توزيع الطلاب ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NashatAtolap(),
                        ),
                      );
                    },
                    child: Row( children: const [
                      Text('نشاط الطلاب',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Anwa3elkotb(),
                        ),
                      );
                    },
                    child: Row( children: const [
                      Text(' أنواع الكتب',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),


                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Almaktba(),
                        ),
                      );
                    },
                    child: Row( children: const [
                      Text(' المكتبة',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),

                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => a3dadAl5rgeen(),
                        ),
                      );

                    },
                    child: Row( children: const [
                      Text('اعداد الخرجين',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Alasttla3at(),
                        ),
                      );
                    },
                    child: Row( children: const [
                      Text('الاستطلاعات',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => anaserAlasttla3at(),
                        ),
                      );

                    },
                    child: Row( children: const [
                      Text('عناصر الاستطلاعات',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mo3amalatALtolap(),
                        ),
                      );
         },
                    child: Row( children: const [
                      Text('معاملات الطلاب',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Alab7as(),
                        ),
                      );

                    },
                    child: Row( children: const [
                      Text('الابحاث',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Alprotocol(),
                        ),
                      );
                    },
                    child: Row( children: const [
                      Text('البرتوكول',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 15,),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => No3Alprotocol(),
                        ),
                      );
                    },
                    child: Row( children: const [
                      Text('نوع البرتوكول',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),),
                  SizedBox(height: 20,),
                  Container(
                    width: 400,
                    height: 1,
                    child:   Divider(
                      color: Color(0xfff4f4f8),
                    ),

                  ),

                  SizedBox(height: 50,),

                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [

                        Text('    Settings ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                        Icon(Icons.settings_outlined)
                      ],),),

                  SizedBox(height: 30,),

                  InkWell(
                    onTap: (){
                      username=null;
                      email=null;
                      jwt=null;

                      Navigator.pop(context);
                    },
                    child: Row( children: [
                      Text('    Sign Out ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      Icon(Icons.logout)
                    ],),),



                ],
              ),
            )),
        ),
      ),
    )
    );

  }
}