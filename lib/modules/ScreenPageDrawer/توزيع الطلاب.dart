

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../constant/colors.dart';
import '../../models/studentdistribution.dart';
import '../../network/http/HttpGet.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditStudentDistributionScreen.dart';
import '../datialesHomeScreen/detailshome.dart';

class Tawzee3Altolap extends StatelessWidget {
  Tawzee3Altolap({Key? key}) : super(key: key);

  late Future<StudentDistribution> studentdistriubtion;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        studentdistriubtion = GetStudentDistrubtion();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF054978),
            leadingWidth: 35,
            leading: IconButton(
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
            titleSpacing: 0,
            title: const Text(
              'توزيع الطلاب',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFFF1770D)),
            ),
          ),
          body: FutureBuilder<StudentDistribution>(
            future: studentdistriubtion,
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
                              DataColumn(label: Text('السنة')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('المستوى')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('بنين')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('بنات')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('CS')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('IS')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('AI')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('NI')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('General')),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                label: Text('Delete'),
                              ),
                              DataColumn(label: Text(' ')),
                            ],
                            rows: List.generate(snapshot.data!.data!.length,
                                    (index) {
                                  final a = snapshot.data!.data![index].attributes!
                                      .year!.data!.attributes!.year
                                      .toString();
                                  final b = snapshot
                                      .data!.data![index].attributes!.level
                                      .toString();
                                  final c = snapshot
                                      .data!.data![index].attributes!.cs!.number
                                      .toString();
                                  final d = snapshot.data!.data![index].attributes!
                                      .attributesIs!.number
                                      .toString();
                                  final e = snapshot
                                      .data!.data![index].attributes!.ai!.number
                                      .toString();
                                  final f = snapshot
                                      .data!.data![index].attributes!.ni!.number
                                      .toString();
                                  final g = snapshot.data!.data![index].attributes!
                                      .general!.number
                                      .toString();
                                  final h = snapshot
                                      .data!.data![index].attributes!.male
                                      .toString();
                                  final i = snapshot
                                      .data!.data![index].attributes!.female
                                      .toString();

                                  return DataRow(
                                      cells: [
                                        DataCell(Container(child: Text('${a}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text("${b}")),
                                            onTap: () {}),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text('${h}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text('${i}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text('${c}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text('${d}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text('${e}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text('${f}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text('${g}'))),
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
                                                      .DeleteStudentDistrubtion(
                                                      id: snapshot.data!
                                                          .data![index].id);
                                                  studentdistriubtion =
                                                      GetStudentDistrubtion();
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
                                                    AddEditStudentDistributionScreen(
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
                      builder: (context) =>
                      const AddEditStudentDistributionScreen()));
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