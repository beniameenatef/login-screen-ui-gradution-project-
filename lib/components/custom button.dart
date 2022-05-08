import 'package:flutter/material.dart';
class DefaultButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onpressed;
  final Color? color;
  const DefaultButton({
    Key? key,
    this.text,
    this.color,
    this.onpressed ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 300,height: 52,
      child:MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200),

        ),
        // padding:EdgeInsetsDirectional.all(13),
        onPressed: onpressed,
        child: Text(
          text!,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20),
        )) ,);

  }
}
