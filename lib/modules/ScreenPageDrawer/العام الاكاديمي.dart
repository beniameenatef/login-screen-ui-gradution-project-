
import 'package:design_ui/models/oneyearmodel.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../network/http/HttpGet.dart';
import '../Edit/AddEditOneYearScreen.dart';

class Al3am_Alacademy extends StatefulWidget {
  const Al3am_Alacademy({Key? key}) : super(key: key);

  @override
  State<Al3am_Alacademy> createState() => _Al3am_AlacademyState();
}

class _Al3am_AlacademyState extends State<Al3am_Alacademy> {
  late Future<Oneyear> oneyear;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oneyear= GetOneYears();
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

        title:Text('العام الاكاديمي',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),)
        ,
      ),
      body: FutureBuilder<Oneyear>(
        future: oneyear,
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
                          DataColumn(label: Text('NO.')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('Year')),

                        ],

                        rows:
                        List.generate(snapshot.data!.data!.length, (index) {
                          final x = index+1;
                          final y = snapshot.data!.data![index].attributes!.year.toString();

                          return DataRow(cells: [

                            DataCell(Container( child: Text("${x}"))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${y}'))),

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
                MaterialPageRoute(builder: (context) => AddEditOneYearScreen()));
          });
        },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
