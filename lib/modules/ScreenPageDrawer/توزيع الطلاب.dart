
import 'package:design_ui/models/studentdistribution.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../Edit/AddEditStudentDistributionScreen.dart';

class Tawzee3Altolap extends StatefulWidget {
  const Tawzee3Altolap({Key? key}) : super(key: key);

  @override
  State<Tawzee3Altolap> createState() => _Tawzee3AltolapState();
}

class _Tawzee3AltolapState extends State<Tawzee3Altolap> {
  late Future<StudentDistribution> studentdistriubtion;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentdistriubtion= GetStudentDistrubtion();
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

        title:Text('توزيع الطلاب',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),)
        ,
      ),
      body: FutureBuilder<StudentDistribution>(
        future: studentdistriubtion,
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


                        ],

                        rows:
                        List.generate(snapshot.data!.data!.length, (index) {
                          final a = snapshot.data!.data![index].attributes!.year!.data!.attributes!.year.toString();
                          final b = snapshot.data!.data![index].attributes!.level.toString();
                          final c = snapshot.data!.data![index].attributes!.cs!.number.toString();
                          final d = snapshot.data!.data![index].attributes!.attributesIs!.number.toString();
                          final e = snapshot.data!.data![index].attributes!.ai!.number.toString();
                          final f = snapshot.data!.data![index].attributes!.ni!.number.toString();
                          final g = snapshot.data!.data![index].attributes!.general!.number.toString();
                          final h = snapshot.data!.data![index].attributes!.male.toString();
                          final i = snapshot.data!.data![index].attributes!.female.toString();


                          return DataRow(cells: [

                            DataCell(Container(child: Text('${a}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container( child: Text("${b}")),onTap: (){

                            }),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${h}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${i}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${c}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${d}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${e}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${f}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${g}'))),
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
                MaterialPageRoute(builder: (context) => AddEditStudentDistributionScreen()));
          });    },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
