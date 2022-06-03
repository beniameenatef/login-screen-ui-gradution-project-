
import 'package:design_ui/models/modelStaff.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../models/Research.dart';
import '../Edit/AddEditResearchScreen.dart';

class Alab7as extends StatefulWidget {
  const Alab7as({Key? key}) : super(key: key);

  @override
  State<Alab7as> createState() => _Alab7asState();
}

class _Alab7asState extends State<Alab7as> {
  late Future<Researches> research;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    research= GetResearch();
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

        title:Text('الابحاث',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),)
        ,
      ),
      body: FutureBuilder<Researches>(
        future: research,
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
                        columnSpacing: 10.0,
                        dataRowHeight: 80,
                        showBottomBorder: true,
                        columns: const [
                          DataColumn(label: Text('السنة',style: TextStyle(color: AppColors.orange,),)),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('البحث',style: TextStyle(color: AppColors.orange),),),
                          DataColumn(label: Text(' ')),

                        ],

                        rows:
                        List.generate(snapshot.data!.data!.length, (index) {
                          final a = snapshot.data!.data![index]!.attributes!.year!.data!.attributes!.Year.toString();
                          final b = snapshot.data!.data![index]!.attributes!.RName.toString();

                          return DataRow(cells: [

                            DataCell(Container(child: Text('${a}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container( child: Text("$b}",maxLines: 5,overflow: TextOverflow.ellipsis,),),onTap: (){

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
                MaterialPageRoute(builder: (context) => AddEditResearchScreen()));
          });    },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
