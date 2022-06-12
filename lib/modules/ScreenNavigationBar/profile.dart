import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../login/userdata.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: (username==null)? Center(child: Text('Guest user'),) : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Divider(color: AppColors.blue,),
          Text("Username",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blue,fontSize: 20),),
          Text(username.toString(),style: TextStyle(fontWeight:FontWeight.w300,color: AppColors.blue,fontSize: 20),),
          Divider(color: AppColors.blue,),
          Text("Email",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blue,fontSize: 20),),
          Text(email.toString(),style: TextStyle(fontWeight: FontWeight.w300,color: AppColors.blue,fontSize: 20),),
          Divider(color: AppColors.blue,),



        ],
      ),
    );
  }
}
