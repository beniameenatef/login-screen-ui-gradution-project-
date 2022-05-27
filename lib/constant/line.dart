import 'package:flutter/material.dart';


/// This is the stateless widget that the main application instantiates.
class line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Vertical Divider Example'),
      ),
      body: Center(child:Row(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 100,
            width: 100,
          ),
          VerticalDivider(color: Colors.black,
            thickness: 2, width: 20,
            indent: 200,
            endIndent: 200,),
          Container(
            color: Colors.blue,
            height: 100,
            width: 100,
          ),
        ],
      ),
      ),
    );
  }
}