import 'package:design_ui/constant/colors.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/modelMaktba.dart';
import '../Edit/AddEditLibraryScreen.dart';

class Almaktba extends StatefulWidget {
  Almaktba({Key? key}) : super(key: key);

  @override
  home createState() => home();
}

class home extends State<Almaktba> {
  TextEditingController edit = TextEditingController();

  // late Future<Year> year;
  late Future<Library> library;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    library = GetLibrary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF054978),
          leadingWidth: 35,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppDrawer(child: detailshomePage()),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFF1770D),
            ),
          ),
          titleSpacing: 0,
          title: const Text(
            'المكتبة',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFFF1770D)),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Column(
                children: [
                  Icon(Icons.edit),
                  Text('Edit'),
                ],
              ),
            )
            // InkWell(
            //   onTap: ()
            //   {
            //
            //   },
            //   child: Column(children: [
            //     Icon(Icons.edit),
            //     Text('Edit'),
            //
            //   ],),
            // )
          ],
        ),
        body: FutureBuilder<Library>(
          future: library,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //List<?>? Yearinfo = snapshot.data!.data!;
              return InteractiveViewer(
                constrained: false,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      DataTable(
                        columnSpacing: 38.0,
                        columns: [
                          DataColumn(label: Text('Year')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('Book Type')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('Number')),
                        ],
                        rows:
                            List.generate(snapshot.data!.data!.length, (index) {
                          dynamic y = snapshot.data!.data![index].attributes!
                              .academicYear!.data!.attributes!.year
                              .toString();
                          dynamic x = snapshot.data!.data![index].attributes!
                              .bookType!.data!.attributes!.type
                              .toString();
                          dynamic z =
                              snapshot.data!.data![index].attributes!.number;

                          return DataRow(cells: [
                            // DataCell(Container(width: 75, child: TextFormField(controller:edit  ,
                            //     keyboardType:TextInputType.name ,
                            //     decoration: InputDecoration(hintText:"${y}" ),
                            //     )
                            // )
                            // ),
                            DataCell(Container(
                                child: (y == Null) ? Text(" ") : Text('${y}'))),
                            DataCell(VerticalDivider(
                              thickness: 3.0,
                              color: AppColors.blue,
                            )),
                            DataCell(Container(
                                child: (x == Null) ? Text(' ') : Text('${x}'))),
                            DataCell(VerticalDivider(
                              thickness: 3.0,
                              color: AppColors.blue,
                            )),
                            DataCell(Container(
                                child: (z == Null) ? Text(" ") : Text('${z}')))
                          ]);
                        }),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: AppColors.blue,
                    ),
                    Text('تحميل'),
                  ],
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddEditLibraryScreen()));
            });
          },
          backgroundColor: AppColors.blue,
          child: const Icon(Icons.add),
        ));
  }
}

// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:design_ui/bloc/home/homecubit.dart';
// import 'package:design_ui/bloc/home/homestate.dart';
// import 'package:design_ui/constant/colors.dart';
// import 'package:design_ui/modules/Drawer/drawer.dart';
// import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%B9%D9%85%D8%A7%D9%84%20%D8%A7%D9%84%D8%A7%D9%83%D8%A7%D8%AF%D9%85%D9%8A%D9%8A%D9%86%20.dart';
// import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
// import 'package:design_ui/network/http/HttpGet.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../models/modelMaktba.dart';
// import '../Edit/AddEditLibraryScreen.dart';
// class Almaktba extends StatelessWidget {
//   Almaktba({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     late Future<Library>? library;
//
//
//   return  BlocConsumer<homecubit,qualityhomestates>
//       (
//
//       listener: (context,state){
//
//
//       },
//       builder: (context, state) {
//          library=GetLibrary();
//         //  var home=homecubit.get(context).modellibrary;
//         // library=  home as Future<Library>? ;
//
//         return Scaffold(
//             appBar:AppBar(
//               backgroundColor: Color(0xFF054978),
//               leadingWidth: 35,
//               leading:
//               IconButton(onPressed: ()
//               {
//                 Navigator.pop(
//                   context,
//                   MaterialPageRoute(builder: (context) =>  AppDrawer(child:detailshomePage()),
//                   ),
//                 );
//               },icon: Icon(Icons.arrow_back_ios,color: Color(0xFFF1770D),),
//               ),
//               titleSpacing: 0,
//
//               title:const Text('المكتبة',style: TextStyle(fontWeight: FontWeight.bold,
//                   color: Color(0xFFF1770D)),),
//               actions: [
//                 IconButton(
//                   onPressed: (){},
//                   icon: Column(children: const [
//                     Icon(Icons.edit),
//                     Text('Edit'),
//
//                   ],),)
//               ],
//             ),
//             // body:  ConditionalBuilder(
//             //     condition: homecubit.get(context).modellibrary != null,
//             //     builder: (context) =>
//             //         builderwidget(homecubit.get(context).modellibrary!),
//             //     fallback: (context) => const Center(
//             //       child: CircularProgressIndicator(),
//             //     )),
//            body: FutureBuilder<Library>(
//               future: library,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   //List<?>? Yearinfo = snapshot.data!.data!;
//                   return InteractiveViewer(
//                     constrained: false,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           SizedBox(
//                             height: 20,
//                           ),
//                           DataTable(
//                             columnSpacing: 38.0,
//                             columns:  [
//                               DataColumn(label: Text('Year')),
//                               DataColumn(label: Text(' ')),
//                               DataColumn(label: Text('Book Type')),
//                               DataColumn(label: Text(' ')),
//                               DataColumn(label: Text('Number')),
//                             ],
//                             rows: List.generate(snapshot.data!.data!.length, (index) {
//                               dynamic y = snapshot.data!.data![index].attributes!.academicYear!.data!.attributes!.year.toString();
//                               dynamic x = snapshot.data!.data![index].attributes!.bookType!.data!.attributes!.type.toString();
//                               dynamic z = snapshot.data!.data![index].attributes!.number;
//
//                               return DataRow(cells: [
//                                 // DataCell(Container(width: 75, child: TextFormField(controller:edit  ,
//                                 //     keyboardType:TextInputType.name ,
//                                 //     decoration: InputDecoration(hintText:"${y}" ),
//                                 //     )
//                                 // )
//                                 // ),
//                                 DataCell(Container(child: ( y== Null)?  Text(" ") : Text('${y}') )),
//                                 DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
//                                 DataCell(Container(child: (x == Null)? Text(' '):Text('${x}'))),
//                                 DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
//                                 DataCell(Container(child: (z == Null)? Text(" "):Text('${z}')))
//                               ]);
//                             }),
//                           ),
//                         ],
//
//                       ),
//                     ),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text('${snapshot.error}');
//                 } else {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//
//                         CircularProgressIndicator(
//                           color: AppColors.blue,
//                         ),
//                         Text('تحميل'),
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 // setState(() {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => AddEditLibraryScreen()));
//                 // });
//               },
//               backgroundColor: AppColors.blue,
//               child: const Icon(Icons.add),
//             )
//         );
//       }, );
//   }
//   // Widget builderwidget(Library home   ) =>
//   //    Column(
//   //     children: [
//   //     InteractiveViewer(
//   //     constrained: false,
//   //     child: Padding(
//   //       padding: const EdgeInsets.all(8.0),
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.end,
//   //         children: [
//   //           SizedBox(
//   //             height: 20,
//   //           ),
//   //           DataTable(
//   //             columnSpacing: 38.0,
//   //             columns:  [
//   //               DataColumn(label: Text('Year')),
//   //               DataColumn(label: Text(' ')),
//   //               DataColumn(label: Text('Book Type')),
//   //               DataColumn(label: Text(' ')),
//   //               DataColumn(label: Text('Number')),
//   //             ],
//   //             rows: List.generate(home.data!.length, (index) {
//   //               dynamic y = home.data!.data![index].attributes!.academicYear!.data!.attributes!.year.toString();
//   //               dynamic x = home.data![index].attributes!.bookType!.data!.attributes!.type.toString();
//   //               dynamic z = home.data![index].attributes!.number;
//   //
//   //               return DataRow(cells: [
//   //                 // DataCell(Container(width: 75, child: TextFormField(controller:edit  ,
//   //                 //     keyboardType:TextInputType.name ,
//   //                 //     decoration: InputDecoration(hintText:"${y}" ),
//   //                 //     )
//   //                 // )
//   //                 // ),
//   //                 DataCell(Container(child: ( y== Null)?  Text(" ") : Text('${y}') )),
//   //                 DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
//   //                 DataCell(Container(child: (x == Null)? Text(' '):Text('${x}'))),
//   //                 DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
//   //                 DataCell(Container(child: (z == Null)? Text(" "):Text('${z}')))
//   //               ]);
//   //             }),
//   //           ),
//   //         ],
//   //
//   //       ),
//   //     ),
//   //   ),
//   //       const SizedBox(
//   //         height: 5.0,
//   //       ),
//   //     ],
//   //    );
//
// }
//
