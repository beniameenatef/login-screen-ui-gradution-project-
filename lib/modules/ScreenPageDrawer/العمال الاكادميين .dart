<<<<<<< Updated upstream
import 'package:design_ui/constant/line.dart';
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
import '../../models/modelStaff.dart';
import '../../network/http/HttpGet.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditAstaffScreen.dart';
import '../datialesHomeScreen/detailshome.dart';

class AL3omal extends StatelessWidget {
  AL3omal({Key? key}) : super(key: key);

  late Future<Astaff> astaff;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        astaff = GetAstaff();

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
<<<<<<< Updated upstream
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
                    ),
                  ],
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
=======
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFF1770D),
>>>>>>> Stashed changes
                ),
              ),
            ),
            titleSpacing: 0,
            title: const Text(
              'أعضاء هيئة التدريس',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: const Color(0xFFF1770D)),
            ),
          ),
          body: FutureBuilder<Astaff>(
            future: astaff,
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
                                        DataCell(Container(child: Text("${y}")),
                                            onTap: () {}),
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
                                                      .DeleteAstaff(
                                                      id: snapshot.data!
                                                          .data![index].id);
                                                  astaff = GetAstaff();

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
                                                    AddEditAstaffScreen(
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
                      builder: (context) => const AddEditAstaffScreen()));
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