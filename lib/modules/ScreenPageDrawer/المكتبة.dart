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
  TextEditingController edit =TextEditingController();

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
        appBar:AppBar(
          backgroundColor: Color(0xFF054978),
          leadingWidth: 35,
          leading:
          IconButton(onPressed: ()
          {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) =>  AppDrawer(child:detailshomePage()),
              ),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddEditLibraryScreen()));
            });    },
          backgroundColor: AppColors.blue,
          child: const Icon(Icons.add),
        )
    );
  }
}
