import 'package:flutter/material.dart';

class MyAppp extends StatelessWidget {
  const MyAppp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();


  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: const Icon(Icons.arrow_right,color: Colors.white),
      elevation: 50,
      dropdownColor:Color(0xFF2F2F31) ,
      style: const TextStyle(color: Color(0xFFF1770D)),
      underline: Container(
        height: 1,
        color: Color(0xFF054978),
      ),
      onChanged: (String? newValue) {
        // setState(() {
        //   dropdownValue = newValue!;
        // });
      },
      items: <String>['2012', '2013', '2014', '2015']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
