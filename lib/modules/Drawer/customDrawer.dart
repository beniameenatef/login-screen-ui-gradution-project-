import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screenpagedrawer/اداره  الجوده والتطوير.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF054978),
      child: SafeArea(
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
          ),
          child: Padding(padding: EdgeInsetsDirectional.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                const [
                  Padding(padding: EdgeInsetsDirectional.only(
                      start: 10,top: 30),child:CircleAvatar(
                    radius: 30,

                  ),),
                  SizedBox(height: 10,),
                  Text('beniameen',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text('bemiameen11@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),),

                ],),
           SizedBox(height: 10,),
              Container(
                  width: 300,
                  child:  const Padding(padding: EdgeInsets.only(left:74,right: 0),
                    child: Divider(
                      color: Color(0xfff4f4f8),
                    ),
                  )
              ),
              SizedBox(height: 15,),
              InkWell(

                onTap: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder:(context)=>adaretalgouda()), (route) => false);
                },
                child: Row( children: const [
                Text('اداره الجوده ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  Icon(Icons.arrow_right)
              ],),),
              const SizedBox(height: 10,),

              InkWell(
                onTap: (){},
                child: Row( children: const [
                Text('اداره الجوده ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  Icon(Icons.arrow_right)
              ],),),
              SizedBox(height: 10,),

              InkWell(
                onTap: (){},
                child: Row( children: [
                Text('اداره الجوده ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                Icon(Icons.arrow_right)
              ],),),
              SizedBox(height: 10,),

              InkWell(
                onTap: (){},
                child: Row( children: [
                Text('اداره الجوده ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                Icon(Icons.arrow_right)
              ],),),
              SizedBox(height: 10,),

              InkWell(
                onTap: (){},
                child: Row( children: [
                Text('اداره الجوده ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                Icon(Icons.arrow_right)
              ],),),
              SizedBox(height: 10,),

              InkWell(
                onTap: (){},
                child: Row( children: [
                Text('اداره الجوده ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                Icon(Icons.arrow_right)
              ],),),
              SizedBox(height: 10,),

              InkWell(
                onTap: (){},
                child: Row( children: [
                Text('اداره الجوده ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                Icon(Icons.arrow_right)
              ],),),
              SizedBox(height: 50,),

              InkWell(
                onTap: (){},
                child: Row( children: [
                Text('Settings ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                Icon(Icons.settings_outlined)
              ],),),
              SizedBox(height: 20,),

              InkWell(
                onTap: (){},
                child: Row( children: [
                Text('Sign Out ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                Icon(Icons.logout)
              ],),),



            ],
          ),),
        ),
      ),
    );
  }
}