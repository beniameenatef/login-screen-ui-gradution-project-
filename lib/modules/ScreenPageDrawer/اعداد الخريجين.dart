

import 'package:design_ui/models/graduatednumbrmodel.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../Edit/AddEditGraduatedNumberScreen.dart';

class a3dadAl5rgeen extends StatefulWidget {
  const a3dadAl5rgeen({Key? key}) : super(key: key);

  @override
  State<a3dadAl5rgeen> createState() => _a3dadAl5rgeenState();
}

class _a3dadAl5rgeenState extends State<a3dadAl5rgeen> {

  late Future<GraduatedNumber> graduatednumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    graduatednumber= GetGraduatedNumbers();
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

        title:Text('أعداد الخرجين',style: TextStyle(fontWeight: FontWeight.bold,
        color: Color(0xFFF1770D)),)
        ,
      ),
       body: FutureBuilder<GraduatedNumber>(
      future: graduatednumber,
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
                        DataColumn(label: Text('Year')),
                        DataColumn(label: Text(' ')),
                        DataColumn(label: Text('CS')),
                        DataColumn(label: Text(' ')),
                        DataColumn(label: Text('IS')),
                        DataColumn(label: Text(' ')),
                        DataColumn(label: Text('AI')),
                        DataColumn(label: Text(' ')),
                        DataColumn(label: Text('NI')),




                      ],

                      rows:
                      List.generate(snapshot.data!.data!.length, (index) {
                        final x = snapshot.data!.data![index].attributes!.academicYear!.data!.attributes!.year.toString();
                        dynamic y = snapshot.data!.data![index].attributes!.cs!.number.toString();
                        dynamic z = snapshot.data!.data![index].attributes!.attributesIs!.number.toString();
                        dynamic a = snapshot.data!.data![index].attributes!.ai!.number.toString();
                        dynamic b = snapshot.data!.data![index].attributes!.ni!.number.toString();


                        return DataRow(cells: [

                          DataCell(Container( child: Text("${x}"))),
                          DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                          DataCell(Container(child: Text('${y}'))),
                          DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                          DataCell(Container( child: Text("${z}"))),
                          DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                          DataCell(Container(child: Text('${a}'))),
                          DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                          DataCell(Container(child: Text('${b}'))),



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
    MaterialPageRoute(builder: (context) => AddEditGraduatedNumberScreen()));
    });
    },
    backgroundColor: AppColors.blue,
    child: const Icon(Icons.add),
    ),
    );
  }
}
