
<<<<<<< Updated upstream
import 'package:design_ui/models/surveyitemmodel.dart';
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
import '../../models/surveyitemmodel.dart';
import '../../network/http/HttpGet.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditSurveyItemScreen.dart';
import '../datialesHomeScreen/detailshome.dart';

class anaserAlasttla3at extends StatelessWidget {
  anaserAlasttla3at({Key? key}) : super(key: key);

  late Future<SurveyItems> surveyitem;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        surveyitem = GetSurveyItem();
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

        title:Text('عناصر الاستطلاعات',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),)
        ,
      ),
      body:FutureBuilder<SurveyItems>(
        future: surveyitem,
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
                        dividerThickness: 4,


                        columnSpacing: 20.0,
                        //dataRowHeight: 70,

                        columns: const [

                          DataColumn(label: Text('العدد')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('البند')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('النوع ')),
                          DataColumn(label: Text(' ')),



                        ],

                        rows:
                        List.generate(snapshot.data!.data!.length, (index) {
                          final a = snapshot.data!.data![index].attributes!.description.toString();
                          final b = index+1;
                          final c = snapshot.data!.data![index].attributes!.survey!.data!.attributes!.sType.toString();


                          return DataRow(cells: [

                            DataCell(Container(child: Text('${b}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container( child: Text("${a}")),onTap: (){

                            }),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${c}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),



                          ]);
                        }),
=======
            titleSpacing: 0,
            title: const Text(
              'عناصر الاستطلاعات',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFFF1770D)),
            ),
          ),
          body: FutureBuilder<SurveyItems>(
            future: surveyitem,
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
                            dividerThickness: 4,

                            columnSpacing: 20.0,
                            //dataRowHeight: 70,

                            columns: const [
                              DataColumn(label: Text('العدد')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('البند')),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('النوع ')),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                label: Text('Delete'),
                              ),
                              DataColumn(label: Text(' ')),
                            ],

                            rows: List.generate(snapshot.data!.data!.length,
                                    (index) {
                                  final a = snapshot
                                      .data!.data![index].attributes!.description
                                      .toString();
                                  final b = index + 1;
                                  final c = snapshot.data!.data![index].attributes!
                                      .survey!.data!.attributes!.sType
                                      .toString();

                                  return DataRow(
                                      cells: [
                                        DataCell(Container(child: Text('${b}'))),
                                        const DataCell(VerticalDivider(
                                          thickness: 3.0,
                                          color: AppColors.blue,
                                        )),
                                        DataCell(Container(child: Text("${a}"))),
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
                                                      .DeleteSurveyItem(
                                                      id: snapshot.data!
                                                          .data![index].id);
                                                  surveyitem = GetSurveyItem();

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
                                                    AddEditSurveyItemScreen(
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
                      builder: (context) => const AddEditSurveyItemScreen()));
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