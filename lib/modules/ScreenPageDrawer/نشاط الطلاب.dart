

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../constant/colors.dart';
import '../../models/studentactivitymodel.dart';
import '../../network/http/HttpGet.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditStudentActivityScreen.dart';
import '../datialesHomeScreen/detailshome.dart';

class NashatAtolap extends StatelessWidget {
  NashatAtolap({Key? key}) : super(key: key);

  late Future<StudentActivity> studentactivity;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit,qualityhomestates>(
      listener: (context,state){},
      builder: (context, state) {
        studentactivity = GetStudentActivity();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF054978),
            leadingWidth: 35,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppDrawer(child: const detailshomePage()),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFF1770D),
              ),
            ),
            titleSpacing: 0,
            title: const Text(
              'نشاط الطلاب',
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF1770D)),
            ),
          ),
          body: FutureBuilder<StudentActivity>(
            future: studentactivity,
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
                              DataColumn(label: Text('العدد')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('المجموع')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('النسبة')),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                label: Text('Delete'),
                              ),
                              DataColumn(label: Text(' ')),
                            ],
                            rows:
                            List.generate(snapshot.data!.data!.length, (index) {
                              final y = snapshot.data!.data![index].attributes!
                                  .year!.data!.attributes!.year
                                  .toString();
                              final x = snapshot
                                  .data!.data![index].attributes!.number
                                  .toString();
                              final z = snapshot
                                  .data!.data![index].attributes!.total
                                  .toString();
                              final a = snapshot
                                  .data!.data![index].attributes!.percentage!
                                  .toString();

                              return DataRow(
                                  cells: [
                                    DataCell(Container(child: Text('${y}'))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: Text("${x}"))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: Text('${z}'))),
                                    const DataCell( VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: Text('${a}%'))),
                                    const DataCell( VerticalDivider(
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
                                              homecubit.get(context).DeleteStudentActivity(
                                                  id: snapshot.data!.data![index].id);
                                              studentactivity =
                                                  GetStudentActivity();
                                              // });
                                            }))),
                                    const DataCell( VerticalDivider(
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
                                                AddEditStudentActivityScreen(
                                                    object: snapshot
                                                        .data!.data![index])));
                                  });
                              // });
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
                      builder: (context) => const AddEditStudentActivityScreen()));
              // });
            },
            backgroundColor: AppColors.blue,
            child: const Icon(Icons.add),
          ),
        );
      },);
  }
}