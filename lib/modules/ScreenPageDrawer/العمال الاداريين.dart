import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../models/Mstaffmodel.dart';
import '../../network/http/HttpGet.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditMstaffScreen.dart';
import '../datialesHomeScreen/detailshome.dart';
class El3omalelEdareen extends StatefulWidget {
  const El3omalelEdareen({Key? key}) : super(key: key);

  @override
  _El3omalelEdareenState createState() => _El3omalelEdareenState();
}

class _El3omalelEdareenState extends State<El3omalelEdareen> {
  late Future<Mstaff> mstaff;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mstaff= GetMstaff();
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

        title:Text('الاداريين',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),),
      ),

      body: FutureBuilder<Mstaff>(
        future: mstaff,
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
                MaterialPageRoute(builder: (context) => AddEditMstaffScreen()));
          });    },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
