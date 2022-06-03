
import 'package:design_ui/models/studentactivitymodel.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../Edit/AddEditStudentActivityScreen.dart';

class NashatAtolap extends StatefulWidget {
  const NashatAtolap({Key? key}) : super(key: key);

  @override
  State<NashatAtolap> createState() => _NashatAtolapState();
}

class _NashatAtolapState extends State<NashatAtolap> {
  late Future<StudentActivity> studentactivity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentactivity= GetStudentActivity();
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

        title:Text('نشاط الطلاب',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),)
        ,
      ),
      body: FutureBuilder<StudentActivity>(
      future: studentactivity,
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
                        DataColumn(label: Text('العدد')),
                        DataColumn(label: Text(' ')),
                        DataColumn(label: Text('المجموع')),
                        DataColumn(label: Text(' ')),
                        DataColumn(label: Text('النسبة')),
                        DataColumn(label: Text(' ')),


                      ],

                      rows:
                      List.generate(snapshot.data!.data!.length, (index) {
                        final y = snapshot.data!.data![index].attributes!.year!.data!.attributes!.year.toString();
                        final x = snapshot.data!.data![index].attributes!.number.toString();
                        final z = snapshot.data!.data![index].attributes!.total.toString();
                        final a = snapshot.data!.data![index].attributes!.percentage!.toString();

                        return DataRow(cells: [

                          DataCell(Container(child: Text('${y}'))),
                          DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                          DataCell(Container( child: Text("${x}")),onTap: (){

                          }),
                          DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                          DataCell(Container(child: Text('${z}'))),
                          DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                          DataCell(Container(child: Text('${a}%'))),
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
    MaterialPageRoute(builder: (context) => AddEditStudentActivityScreen()));
    });    },
    backgroundColor: AppColors.blue,
    child: const Icon(Icons.add),
    ),
    );
  }
}
