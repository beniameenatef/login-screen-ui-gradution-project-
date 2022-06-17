

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../constant/colors.dart';
import '../../models/graduatednumbrmodel.dart';
import '../../network/http/HttpGet.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditGraduatedNumberScreen.dart';
import '../datialesHomeScreen/detailshome.dart';

class a3dadAl5rgeen extends StatelessWidget {
  a3dadAl5rgeen({Key? key}) : super(key: key);

  late Future<GraduatedNumber> graduatednumber;

  @override
  Widget build(BuildContext context) {
    graduatednumber = GetGraduatedNumbers();

    return BlocConsumer<homecubit, qualityhomestates>(
        builder: (context, state) {
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
              titleSpacing: 0,
              title: Text(
                'أعداد الخرجين',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFFF1770D)),
              ),
            ),
            body: FutureBuilder<GraduatedNumber>(
              future: graduatednumber,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return InteractiveViewer(
                    constrained: false,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            DataTable(
                              columnSpacing: 50.0,
                              columns: const [
                                DataColumn(label: Text('Year')),
                                DataColumn(label: Text(' ')),
                                DataColumn(label: Text('CS')),
                                DataColumn(label: Text(' ')),
                                DataColumn(label: Text('IS')),
                                DataColumn(label: Text(' ')),
                                DataColumn(label: Text('AI')),
                                DataColumn(label: Text(' ')),
                                DataColumn(
                                  label: Text('NI'),
                                ),
                                DataColumn(label: Text(' ')),
                                DataColumn(
                                  label: Text('Delete'),
                                ),
                                DataColumn(label: Text(' ')),
                              ],
                              rows: List.generate(snapshot.data!.data!.length,
                                      (index) {
                                    dynamic x = snapshot.data?.data?[index]?.attributes?.academicYear?.data?.attributes?.Year.toString();
                                    dynamic y = snapshot
                                        .data!.data![index]!.attributes!.CS!.Number
                                        .toString();
                                    dynamic z = snapshot.data!.data![index]
                                        ?.attributes!.IS!.Number
                                        .toString();
                                    dynamic a = snapshot
                                        .data!.data![index]!.attributes!.AI!.Number
                                        .toString();
                                    dynamic b = snapshot
                                        .data!.data![index]!.attributes!.NI!.Number
                                        .toString();
                                    (x == null )? print(''):print(x);



                                    return DataRow(
                                        cells: [
                                          DataCell(Container(child: (x==null)? Text("0"):Text("${x}"))),
                                          const DataCell(VerticalDivider(
                                            thickness: 3.0,
                                            color: AppColors.blue,
                                          )),
                                          DataCell(Container(child:(y==null)? Text("0"): Text('${y}'))),
                                          const DataCell(VerticalDivider(
                                            thickness: 3.0,
                                            color: AppColors.blue,
                                          )),
                                          DataCell(Container(child: (z==null)? Text("0"):Text("${z}"))),
                                          const DataCell(VerticalDivider(
                                            thickness: 3.0,
                                            color: AppColors.blue,
                                          )),
                                          DataCell(Container(child:(a==null)? Text("0"): Text('${a}'))),
                                          const DataCell(VerticalDivider(
                                            thickness: 3.0,
                                            color: AppColors.blue,
                                          )),
                                          DataCell(Container(child: (b==null)? Text("0"):Text('${b}'))),
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
                                                  homecubit
                                                      .get(context)
                                                      .DeleteGraduatedNumbers(
                                                      id: snapshot
                                                          .data!.data![index]?.id);
                                                },
                                              ))),
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
                                                      AddEditGraduatedNumberScreen(
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
                        builder: (context) => const AddEditGraduatedNumberScreen()));
                // });
              },
              backgroundColor: AppColors.blue,
              child: const Icon(Icons.add),
            ),
          );
        },
        listener: (context, state) {});
  }
}