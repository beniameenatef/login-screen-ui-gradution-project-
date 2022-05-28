// import 'dart:convert';
//
// import 'package:design_ui/bloc/home/homecubit.dart';
// import 'package:design_ui/bloc/home/homestate.dart';
// import 'package:design_ui/models/homemodels.dart';
// import 'package:design_ui/models/yearsmodel.dart';
// import 'package:design_ui/network/http/HttpGet.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:http/http.dart' as http;
//
// class MyAppp extends StatelessWidget {
//   const MyAppp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MyStatefulWidget();
//
//
//   }
// }
//
// class MyStatefulWidget extends  StatelessWidget{
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocConsumer<homecubit,qualityhomestates>(
//         listener: (context, state) {
//
//         },
//       builder: (context, state) {
//        var homesubit= homecubit.get(context);
// List<YearDatum?>?yearinfo;
//         return ListView.builder(shrinkWrap: true,
//             itemBuilder: (context, index)
//             {
//               return dropdwonwidget(homesubit.year!,index);
//
//
//               },
//         itemCount:yearinfo!.length,
//         // shrinkWrap: true,
//         // physics: ,
//     );},
//     );
//   }
//   Widget dropdwonwidget(Year year,index)=> Scaffold(
//     appBar: AppBar(
//       title: Text("Hospital Management"),
//     ),
//     body: Center(
//       child: DropdownButton(
//         items:year.
//         data!.map((e) {
//           return DropdownMenuItem(
//             child: Text("${e.attributes?.year}"),
//             value: Text("${e.attributes?.year}")
//           );
//         }).toList(),
//         onChanged: (newVal) {
//
//         },
//       ),
//     ),
//   );}
// //       DropdownButton<String>(
// //     icon: const Icon(Icons.arrow_right,color: Colors.white),
// //     elevation: 50,
// //     dropdownColor:Color(0xFF2F2F31) ,
// //     style: const TextStyle(color: Color(0xFFF1770D)),
// //     underline: Container(
// //       height: 1,
// //       color: Color(0xFF054978),
// //     ),
// // onChanged: (dynamic newvalue)
// // {
// //   // setState(() {
// //   //
// //   // });
// // },
// //     items:<Widget> [Column(children: [
// //
// //     ],)
// //    ]
// //         .map<DropdownMenuItem<String>>((Widget value) {
// //       return DropdownMenuItem<String>(
// //         value: value,
// //         child: Text(value),
// //       );
// //     }).toList(),
// //   );
//
//
//
//
//
//
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   this.GetYears();
//   // }
//   // @override
//   // Widget build(BuildContext context) {
//   //   Year year;
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text("Hospital Management"),
//   //     ),
//   //     body: Center(
//   //       child: DropdownButton(
//   //         items:year.data!..
//   //         data.map((e) {
//   //           return DropdownMenuItem(
//   //             child: Text("${e.}"),
//   //             value: years['id'].toString(),
//   //           );
//   //         }).toList(),
//   //         onChanged: (newVal) {
//   //           setState(() {
//   //             _mySelection = "${newVal}";
//   //           });
//   //         },
//   //         value: _mySelection,
//   //       ),
//   //     ),
//   //   );
//   // }


import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/yearsmodel.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  //country
  List country_data = [];
  List years = [];

  String? countryid;                                 //default id for the dropdown
  //its null for me you can copy an id from api and place here it will be seen....
  Future<String> country() async {
    final encode=Uri.encodeFull("Your API url");
    print(encode);
    var res = await http.get(Uri.parse("Your API url"),
        headers: {"Accept": "application/json"}
        ); //if you have any auth key place here...properly..
    var resBody = json.decode(res.body);

    setState(() {
      country_data = resBody;
    });

    return "Sucess";
  }

  late Future<Year> year;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetYears();
    //years=GetYears()

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown #API"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Container(
          padding: EdgeInsets.all(15.0),      //some padding
          child: Column(
            children: <Widget>[
              DecoratedBox(
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    //Why you have used Stack ??????
                    //B'coz it make clickable to whole decorated Box!!!! as you can click anywhere for dropdown !!!
                    child: Stack(
                      children: <Widget>[
//Country Text
                        Text(
                          "Country:",
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),

//Dropdown that has no loine beneath

                        DropdownButtonHideUnderline(
                          child:

//starting the dropdown
                          DropdownButton(
                            items: country_data.map((item) {
                              return new DropdownMenuItem(
                                  child: new Text(
                                    item['CountryName'],    //Names that the api dropdown contains
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  value: item['CountryID'].toString()       //Id that has to be passed that the dropdown has.....
                                //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
                              );
                            }).toList(),
                            onChanged: (String? newVal) {
                              setState(() {
                                countryid = newVal;
                                print(countryid.toString());
                              });
                            },
                            value: countryid,                 //pasing the default id that has to be viewed... //i havnt used something ... //you can place some (id)
                          ),


                        )
                      ],
                    ),
                  )),
            ],
          )
      ),

    );
  }
}