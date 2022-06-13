

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../constant/colors.dart';
import '../../models/studenttransactionmodel.dart';
import '../../network/http/HttpGet.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditStudentTransactionScreen.dart';
import '../datialesHomeScreen/detailshome.dart';

class Mo3amalatALtolap extends StatelessWidget {
  Mo3amalatALtolap({Key? key}) : super(key: key);

  late Future<StudentTransaction> studenttransaction;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        studenttransaction = GetStudentTransaction();
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
              'معاملات الطلاب',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: const Color(0xFFF1770D)),
            ),
          ),
          body: FutureBuilder<StudentTransaction>(
            future: studenttransaction,
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
                            headingRowColor: MaterialStateColor.resolveWith(
                                  (states) {
                                return AppColors.blue;
                              },
                            ),
                            headingRowHeight: 40,
                            dividerThickness: 3,
                            columnSpacing: 50.0,
                            columns: const [
                              DataColumn(
                                  label: Text(
                                    'السنة',
                                    style: TextStyle(color: AppColors.orange),
                                  )),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                  label: Text(
                                    'النسبه',
                                    style: TextStyle(color: AppColors.orange),
                                  )),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                  label: Text(
                                    'الاستطلاع',
                                    style: TextStyle(color: AppColors.orange),
                                  )),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                label: Text('Delete'),
                              ),
                              DataColumn(label: Text(' ')),
                            ],
                            rows: List.generate(snapshot.data!.data!.length,
                                    (index) {
                                  final a = snapshot.data!.data![index]?.attributes!
                                      .academicYear!.data!.attributes!.Year
                                      .toString();
                                  final b = snapshot
                                      .data!.data![index]?.attributes!.Percentage
                                      .toString();
                                  final c = snapshot.data!.data![index]?.attributes!
                                      .surveyItem!.data!.attributes!.Description
                                      .toString();

                                  return DataRow(
                                      cells: [
                                        DataCell(Container(child: Text('${a}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text("${b}%"))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text('${c}'))),
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
                                                      .DeleteStudentTransaction(
                                                      id: snapshot.data!
                                                          .data![index]!.id);
                                                  studenttransaction =
                                                      GetStudentTransaction();
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
                                                    AddEditStudentTransactionScreen(
                                                        object: snapshot.data!
                                                            .data![index])));
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
                      const AddEditStudentTransactionScreen()));
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