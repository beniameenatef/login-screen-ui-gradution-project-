import 'package:design_ui/constant/line.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpGet.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../models/modelStaff.dart';
import '../Edit/AddEditAstaffScreen.dart';

class AL3omal extends StatefulWidget {
  AL3omal({Key? key}) : super(key: key);

  @override
  home createState() => home();
}

class home extends State<AL3omal> {
  late Future<Astaff> astaff;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    astaff= GetAstaff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF054978),
          leadingWidth: 40,
          leading:Padding(padding: EdgeInsetsDirectional.only(start: 10),
          child:IconButton(onPressed: ()
          {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) =>  AppDrawer(child:detailshomePage()),
              ),
            );
          },icon: Icon(Icons.arrow_back_ios,color: Color(0xFFF1770D),),
          ),),
          titleSpacing: 0,

          title:Text('أعضاء هيئة التدريس',style: TextStyle(fontWeight: FontWeight.bold,
              color: Color(0xFFF1770D)),),
        ),

        body: FutureBuilder<Astaff>(
          future: astaff,
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
                        DataColumn(label: Text('الأسم')),
                        DataColumn(label: Text(' ')),
                        DataColumn(label: Text('المسمى الوظيفى')),
                        DataColumn(label: Text(' ')),


                      ],

                      rows:
                      List.generate(snapshot.data!.data!.length, (index) {
                        final y = snapshot.data!.data![index].attributes!.name.toString();
                        final x = snapshot.data!.data![index].attributes!.job.toString();
                        final z= index+1;

                        return DataRow(cells: [

                          DataCell(Container(child: Text('${z}'))),
                          DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                          DataCell(Container( child: Text("${y}")),onTap: (){

                          }),
                          DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                          DataCell(Container(child: Text('${x}'))),
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
                MaterialPageRoute(builder: (context) => AddEditAstaffScreen()));
          });    },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

}
