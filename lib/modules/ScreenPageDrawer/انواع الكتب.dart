
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../constant/colors.dart';
import '../../models/bookTypemodel.dart';
import '../../network/http/HttpGet.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditBookTypeScreen.dart';
import '../datialesHomeScreen/detailshome.dart';

class Anwa3elkotb extends StatelessWidget {
  Anwa3elkotb({Key? key}) : super(key: key);

  late Future<Booktype> booktype;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        booktype = GetBookType();

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
                      builder: (context) => AppDrawer(child: const detailshomePage()),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFF1770D),
                ),
              ),
            ),
            titleSpacing: 0,
            title: const Text(
              'أنواع الكتب',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFFF1770D)),
            ),
          ),
          body: FutureBuilder<Booktype>(
            future: booktype,
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
                              DataColumn(label: Text('NO.')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('BOOK TYPE')),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                label: Text('Delete'),
                              ),
                              DataColumn(label: Text(' ')),
                            ],
                            rows: List.generate(snapshot.data!.data!.length,
                                    (index) {
                                  final x = index + 1;
                                  final y = snapshot
                                      .data!.data![index].attributes!.type
                                      .toString();

                                  return DataRow(
                                      cells: [
                                        DataCell(Container(child: Text("${x}"))),
                                        const DataCell( VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text('${y}'))),
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
                                                      .DeleteBookType(
                                                      id: snapshot.data!
                                                          .data![index].id);
                                                  booktype = GetBookType();

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
                                                    AddEditBookTypeScreen(
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
                      builder: (context) => const AddEditBookTypeScreen()));
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