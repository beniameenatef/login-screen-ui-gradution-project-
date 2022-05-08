import 'package:design_ui/constant/colors.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool  ?obserText;
  final TextEditingController ?controller;
  final String? Function (String?)? validate;
  final IconData? prefix;
  final String ?text;

  final Function() ?suffixPressed;
  PasswordTextFormField({
    this.controller,
    this.suffixPressed,
    this.text,
    this.obserText, this.validate, this.prefix,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      obscureText: obserText!,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue, width: 2,),
          borderRadius:BorderRadius.circular(10),

        ),hintText: text,
        prefixIcon: Icon(
          prefix,color: AppColors.black,
        ),

        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            obserText == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
