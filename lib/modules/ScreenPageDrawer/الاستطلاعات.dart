
import 'package:design_ui/models/surveymodel.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../Edit/AddEditSurveyScreen.dart';

class Alasttla3at extends StatefulWidget {
  const Alasttla3at({Key? key}) : super(key: key);

  @override
  State<Alasttla3at> createState() => _Alasttla3atState();
}

class _Alasttla3atState extends State<Alasttla3at> {
  late Future<Surveys> survey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    survey= GetSurvey();
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

        title:const Text('الاستطلاعات',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),)
        ,
      ),
      body: FutureBuilder<Surveys>(
        future: survey,
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
                          DataColumn(label: Text('نوع الاستطلاع')),
                          DataColumn(label: Text(' ')),



                        ],

                        rows:
                        List.generate(snapshot.data!.data!.length, (index) {
                          final a = snapshot.data!.data![index].attributes!.sType.toString();
                          final b = index+1;


                          return DataRow(cells: [

                            DataCell(Container(child: Text('${b}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container( child: Text("${a}")),onTap: (){

                            }),
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
                MaterialPageRoute(builder: (context) => AddEditSurveyScreen()));
          });    },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
