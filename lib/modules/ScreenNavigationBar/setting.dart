import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../login/userdata.dart';

class setting extends StatelessWidget {
  const setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (username==null)? Center(child: Text('Guest user')):Column(
      children:  [
        Divider(color: AppColors.blue,),
        InkWell(
          onTap: (){
            username=null;
            email=null;
            jwt=null;

            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row( children: [
              Icon(Icons.logout,color: AppColors.blue,),
              Text('Sign Out ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.blue),),

            ],),
          ),),
        Divider(color: AppColors.blue,),

      ],
    );
  }
}
