
import 'package:design_ui/constant/colors.dart';
import 'package:flutter/material.dart';
class DefaultTextField extends StatelessWidget {
 final TextEditingController?controller;
  final String? Function (String?)? validate;
  final String? text;
    IconData? prefix;
    int? max;
    TextInputType?  keyboardtype;



  DefaultTextField({
    Key? key,
    this.controller,
    this.validate,
    this.text,
    this.prefix,
    this.max,
    this.keyboardtype


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(


    controller: controller,
      validator: validate,
      keyboardType: keyboardtype,
      maxLines: max,
      decoration: InputDecoration(
        hintText: text,

        // prefixIcon: Icon(
        //   prefix,color: AppColors.black,
        // ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue, width: 2,),
            borderRadius:BorderRadius.circular(15),

          ),

          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.grey, width: 1.5),
          // borderRadius:BorderRadius.circular(10),
          // ),
      ),

    );


  }
}
