<<<<<<< Updated upstream
import 'package:design_ui/constant/colors.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpGet.dart';
=======
>>>>>>> Stashed changes
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../constant/colors.dart';
import '../../models/modelMaktba.dart';
import '../../models/yearsmodel.dart';
import '../../network/http/HttpGet.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditLibraryScreen.dart';
import '../datialesHomeScreen/detailshome.dart';

class Almaktba extends StatelessWidget {
  TextEditingController edit = TextEditingController();

  late Future<Year> year;
  late Future<Library>? library;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        library = GetLibrary();
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF054978),
              leadingWidth: 35,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(
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
<<<<<<< Updated upstream
            );
          },icon: Icon(Icons.arrow_back_ios,color: Color(0xFFF1770D),),
          ),
          titleSpacing: 0,

          title:const Text('المكتبة',style: TextStyle(fontWeight: FontWeight.bold,
              color: Color(0xFFF1770D)),),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Column(children: [
              Icon(Icons.edit),
              Text('Edit'),

            ],),)
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
                        columns:  [
                          DataColumn(label: Text('Year')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('Book Type')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('Number')),
                        ],
                        rows: List.generate(snapshot.data!.data!.length, (index) {
                          dynamic y = snapshot.data!.data![index].attributes!.academicYear!.data!.attributes!.year.toString();
                          dynamic x = snapshot.data!.data![index].attributes!.bookType!.data!.attributes!.type.toString();
                          dynamic z = snapshot.data!.data![index].attributes!.number;

                          return DataRow(cells: [
                            // DataCell(Container(width: 75, child: TextFormField(controller:edit  ,
                            //     keyboardType:TextInputType.name ,
                            //     decoration: InputDecoration(hintText:"${y}" ),
                            //     )
                            // )
                            // ),
                            DataCell(Container(child: ( y== Null)?  Text(" ") : Text('${y}') )),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: (x == Null)? Text(' '):Text('${x}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: (z == Null)? Text(" "):Text('${z}')))
                          ]);
                        }),
                      ),
=======
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
                    children: const [
                      Icon(Icons.edit),
                      Text('Edit'),
>>>>>>> Stashed changes
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
                            columns: const [
                              DataColumn(label: Text('Year')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('Book Type')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('Number')),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                label: Text('Delete'),
                              ),
                              DataColumn(label: Text(' ')),
                            ],
                            rows: List.generate(snapshot.data!.data!.length,
                                    (index) {
                                  dynamic y = snapshot
                                      .data!
                                      .data![index]
                                      .attributes!
                                      .academicYear!
                                      .data!
                                      .attributes!
                                      .year
                                      .toString();
                                  dynamic x = snapshot.data!.data![index]
                                      .attributes!.bookType!.data!.attributes!.type
                                      .toString();
                                  dynamic z = snapshot
                                      .data!.data![index].attributes!.number;

                                  return DataRow(
                                      cells: [
                                        // DataCell(Container(width: 75, child: TextFormField(controller:edit  ,
                                        //     keyboardType:TextInputType.name ,
                                        //     decoration: InputDecoration(hintText:"${y}" ),
                                        //     )
                                        // )
                                        // ),
                                        DataCell(Container(
                                            child: (y == Null)
                                                ? Text(" ")
                                                : Text('${y}'))),
                                        DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(
                                            child: (x == Null)
                                                ? Text(' ')
                                                : Text('${x}'))),
                                        DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(
                                            child: (z == Null)
                                                ? Text(" ")
                                                : Text('${z}'))),
                                        DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(
                                            child: IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: AppColors.blue,
                                                ),
                                                onPressed: () {
                                                  // setState(() {
                                                  homecubit
                                                      .get(context)
                                                      .DeleteLibrary(snapshot
                                                      .data!.data![index].id);
                                                  // homecubit.get(context).GetLibrary();
                                                  library = GetLibrary();

                                                  // });
                                                }))),
                                        DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                      ],
                                      onLongPress: () {
                                        // setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddEditLibraryScreen(
                                                        object: snapshot
                                                            .data!.data![index])));
                                        // });
                                      });
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
                // setState(() {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddEditLibraryScreen()));
                // MaterialPageRoute(builder: (context) => AddEditLibraryScreen()));
                // });
              },
              backgroundColor: AppColors.blue,
              child: const Icon(Icons.add),
            ));
      },
    );
  }
}