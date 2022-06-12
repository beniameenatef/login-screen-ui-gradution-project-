<<<<<<< Updated upstream
=======


import 'dart:async';

>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../constant/colors.dart';
import '../../models/Mstaffmodel.dart';
import '../../network/http/HttpGet.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditMstaffScreen.dart';
import '../datialesHomeScreen/detailshome.dart';

class El3omalelEdareen extends StatelessWidget {
  El3omalelEdareen({Key? key}) : super(key: key);

  late Future<Mstaff> mstaff;
<<<<<<< Updated upstream

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mstaff= GetMstaff();
  }
=======
  late StreamSubscription<Mstaff> delete;
>>>>>>> Stashed changes

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        mstaff = GetMstaff();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF054978),
            leadingWidth: 40,
            leading: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AppDrawer(child: const detailshomePage()),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: const Color(0xFFF1770D),
                ),
              ),
<<<<<<< Updated upstream
            );
          },icon: Icon(Icons.arrow_back_ios,color: Color(0xFFF1770D),),
          ),),
        titleSpacing: 0,

        title:Text('الاداريين',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),),
      ),

      body: FutureBuilder<Mstaff>(
        future: mstaff,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InteractiveViewer(
              constrained: false,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      DataTable(

                        columnSpacing: 50.0,
                        columns: const [
                          DataColumn(label: Text('العدد')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('الأسم')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('المسمى الوظيفى')),
                          DataColumn(label: Text(' ')),


                        ],

                        rows:
                        List.generate(snapshot.data!.data!.length, (index) {
                          final y = snapshot.data!.data![index].attributes!.name.toString();
                          final x = snapshot.data!.data![index].attributes!.job.toString();
                          final z= index+1;

                          return DataRow(cells: [

                            DataCell(Container(child: Text('${z}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container( child: Text("${y}")),onTap: (){

                            }),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${x}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),


                          ]);
                        }),
=======
            ),
            titleSpacing: 0,
            title: const Text(
              'الاداريين',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: const Color(0xFFF1770D)),
            ),
          ),
          body: FutureBuilder<Mstaff>(
            future: mstaff,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return InteractiveViewer(
                  constrained: false,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          DataTable(
                            columnSpacing: 50.0,
                            columns: const [
                              DataColumn(label: Text('العدد')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('الأسم')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('المسمى الوظيفى')),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                label: Text('Delete'),
                              ),
                              DataColumn(label: Text(' ')),
                            ],
                            rows: List.generate(snapshot.data!.data!.length,
                                    (index) {
                                  final y = snapshot
                                      .data!.data![index].attributes!.name
                                      .toString();
                                  final x = snapshot
                                      .data!.data![index].attributes!.job
                                      .toString();
                                  final z = index + 1;

                                  return DataRow(
                                      cells: [
                                        DataCell(Container(child: Text('${z}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text("${y}"))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text('${x}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(
                                            child: IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: AppColors.blue,
                                                ),
                                                onPressed: () {
                                                  // setState(() {
                                                  homecubit
                                                      .get(context)
                                                      .DeleteMstaff(
                                                      id: snapshot.data!
                                                          .data![index].id);
                                                  mstaff = GetMstaff();
                                                  // });
                                                }))),
                                        const DataCell(VerticalDivider(
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
                                                    AddEditMstaffScreen(
                                                        object: snapshot
                                                            .data!.data![index])));
                                        // });
                                      });
                                }),
                          ),
                        ],
                      )),
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
>>>>>>> Stashed changes
                      ),
                      Text('تحميل'),
                    ],
<<<<<<< Updated upstream
                  )
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
                MaterialPageRoute(builder: (context) => AddEditMstaffScreen()));
          });    },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
=======
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
                      builder: (context) => const AddEditMstaffScreen()));
              // });
            },
            backgroundColor: AppColors.blue,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
>>>>>>> Stashed changes
