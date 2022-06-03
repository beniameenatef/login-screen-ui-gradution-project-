
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../models/labmodel.dart';
import '../../network/http/HttpGet.dart';
import '../Edit/AddEditLabScreen.dart';

class Alma3amel extends StatefulWidget {
  const Alma3amel({Key? key}) : super(key: key);

  @override
  State<Alma3amel> createState() => _Alma3amelState();
}

class _Alma3amelState extends State<Alma3amel> {
  late Future<Lab> lab;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lab= GetLab();
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

        title:Text('المعامل',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),)
        ,
      ),
      body: FutureBuilder<Lab>(
        future: lab,
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
                          DataColumn(label: Text('العدد')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('رقم المعمل')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('عدد الاجهزة')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('العامل المسئول')),
                          DataColumn(label: Text(' ')),


                        ],

                        rows:
                        List.generate(snapshot.data!.data!.length, (index) {
                          final y = snapshot.data!.data![index].attributes!.labNumber.toString();
                          final x = snapshot.data!.data![index].attributes!.pCnumber.toString();
                          final a = snapshot.data!.data![index].attributes!.mid!.data!.attributes!.name.toString();
                          final z= index+1;

                          return DataRow(cells: [

                            DataCell(Container(child: Text('${z}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container( child: Text("${y}")),onTap: (){

                            }),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${x}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${a}'))),
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
                MaterialPageRoute(builder: (context) => AddEditLabScreen()));
          });    },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
