
<<<<<<< Updated upstream
import 'package:design_ui/models/protocolmodel.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpGet.dart';
=======
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../constant/colors.dart';
import '../../models/protocolmodel.dart';
import '../../network/http/HttpGet.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditProtocolScreen.dart';
import '../datialesHomeScreen/detailshome.dart';

class Alprotocol extends StatelessWidget {
  Alprotocol({Key? key}) : super(key: key);

  late Future<Protocol> protocol;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        protocol = Getprotocol();
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
                color: Color(0xFFF1770D),
              ),
            ),
<<<<<<< Updated upstream
          );
        },icon: Icon(Icons.arrow_back_ios,color: Color(0xFFF1770D),),
        ),
        titleSpacing: 0,

        title:Text('البروتوكول',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),)
        ,
      ),
      body: FutureBuilder<Protocol>(
        future: protocol,
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
                        headingRowColor: MaterialStateColor.resolveWith((states) {return AppColors.blue;},),
                        headingRowHeight: 40,
                        dividerThickness: 3,
                        columnSpacing: 50.0,
                        columns: const [
                          DataColumn(label: Text('العدد',style: TextStyle(color: AppColors.orange),)),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('الاسم',style: TextStyle(color: AppColors.orange),)),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('النوع',style: TextStyle(color: AppColors.orange),)),
                          DataColumn(label: Text(' ')),
                        ],

                        rows:
                        List.generate(snapshot.data!.data!.length, (index) {
                          final a = snapshot.data!.data![index]!.attributes!.Name!.toString();
                          final b = snapshot.data!.data![index]!.attributes!.protocolType!.data!.attributes!.pType.toString();
                          final c = index+1;

                          return DataRow(cells: [

                            DataCell(Container(child: Text('${c}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container( child: Text("${a}")),onTap: (){

                            }),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${b}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),

                          ]);
                        }),
=======
            titleSpacing: 0,
            title: const Text(
              'البروتوكول',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: const Color(0xFFF1770D)),
            ),
          ),
          body: FutureBuilder<Protocol>(
            future: protocol,
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
                                    'العدد',
                                    style: TextStyle(color: AppColors.orange),
                                  )),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                  label: Text(
                                    'الاسم',
                                    style: TextStyle(color: AppColors.orange),
                                  )),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                  label: Text(
                                    'النوع',
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
                                  final a = snapshot
                                      .data!.data![index]!.attributes!.Name!
                                      .toString();
                                  final b = snapshot.data!.data![index]!.attributes!
                                      .protocolType!.data!.attributes!.pType
                                      .toString();
                                  final c = index + 1;

                                  return DataRow(
                                      cells: [
                                        DataCell(Container(child: Text('${c}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text("${a}"))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text('${b}'))),
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
                                                      .Deleteprotocol(
                                                      id: snapshot.data!
                                                          .data![index]!.id);
                                                  protocol = Getprotocol();
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
                                                    AddEditProtocolScreen(
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
                      builder: (context) => const AddEditProtocolScreen()));
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