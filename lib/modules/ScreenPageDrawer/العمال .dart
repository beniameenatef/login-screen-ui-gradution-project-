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

          title:Text('العاملين',style: TextStyle(fontWeight: FontWeight.bold,
              color: Color(0xFFF1770D)),),
        ),

        body: FutureBuilder<Astaff>(
          future: astaff,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Container(
                    width: double.infinity,

                    child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: 10,
                      ),
                      DataTable(

                        columnSpacing: 50.0,
                        columns: const [
                          DataColumn(label: Text('الأسم')),
                          // DataColumn(label: IconButton(onPressed: (){},icon: ,)),
                          DataColumn(label: Text('الوظيفة')),
                          DataColumn(label: Text('تعديل')),

                        ],

                        rows:
                        List.generate(snapshot.data!.data!.length, (index) {
                          final y = snapshot.data!.data![index].attributes!.name.toString();
                          final x = snapshot.data!.data![index].attributes!.job.toString();

                          return DataRow(cells: [
                            DataCell(Container(width: double.infinity, child: Text("${y}"))),
                            DataCell(Container(child: Text('${x}'))),
                            DataCell(Container(width: double.infinity, child: IconButton(onPressed: (){
                              setState(() {

                              });
                            },
                              icon: Icon(Icons.edit),))),
                          ]);
                        }),
                      ),
                    ],
                  ),)
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
