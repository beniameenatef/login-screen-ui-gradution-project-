
import 'package:design_ui/models/studenttransactionmodel.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../Edit/AddEditStudentTransactionScreen.dart';

class Mo3amalatALtolap extends StatefulWidget {
  const Mo3amalatALtolap({Key? key}) : super(key: key);

  @override
  State<Mo3amalatALtolap> createState() => _Mo3amalatALtolapState();
}

class _Mo3amalatALtolapState extends State<Mo3amalatALtolap> {
  late Future<StudentTransaction> studenttransaction;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studenttransaction= GetStudentTransaction();
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

        title:Text('معاملات الطلاب',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),)
        ,
      ),
      body:FutureBuilder<StudentTransaction>(
        future: studenttransaction,
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
                          DataColumn(label: Text('السنة',style: TextStyle(color: AppColors.orange),)),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('النسبه',style: TextStyle(color: AppColors.orange),)),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('الاستطلاع',style: TextStyle(color: AppColors.orange),)),
                          DataColumn(label: Text(' ')),



                        ],

                        rows:
                        List.generate(snapshot.data!.data!.length, (index) {
                          final a = snapshot.data!.data![index]?.attributes!.academicYear!.data!.attributes!.Year.toString();
                          final b = snapshot.data!.data![index]?.attributes!.Percentage.toString();
                          final c = snapshot.data!.data![index]?.attributes!.surveyItem!.data!.attributes!.Description.toString();


                          return DataRow(cells: [

                            DataCell(Container(child: Text('${a}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container( child: Text("${b}%")),onTap: (){

                            }),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${c}'))),
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
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEditStudentTransactionScreen()));
          });    },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
