import 'package:design_ui/models/bookTypemodel.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../Drawer/drawer.dart';
import '../Edit/AddEditBookTypeScreen.dart';
import '../datialesHomeScreen/detailshome.dart';
class Anwa3elkotb extends StatefulWidget {
  const Anwa3elkotb({Key? key}) : super(key: key);

  @override
  _Anwa3elkotbState createState() => _Anwa3elkotbState();
}

class _Anwa3elkotbState extends State<Anwa3elkotb> {
  late Future<Booktype> booktype;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    booktype= GetBookType();
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

        title:Text('أنواع الكتب',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),),
      ),

      body: FutureBuilder<Booktype>(
        future: booktype,
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
                          DataColumn(label: Text('BOOK TYPE')),
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('Edit')),




                        ],

                        rows:
                        List.generate(snapshot.data!.data!.length, (index) {
                          final x = index+1;
                          final y = snapshot.data!.data![index].attributes!.type.toString();

                          return DataRow(cells: [

                            DataCell(Container( child: Text("${x}"))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container(child: Text('${y}'))),
                            DataCell(VerticalDivider(thickness: 3.0,color: AppColors.blue,)),
                            DataCell(Container( child: IconButton(onPressed: (){
                              setState(() {

                              });
                            },
                              icon: Icon(Icons.edit),))),

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
                MaterialPageRoute(builder: (context) => AddEditBookTypeScreen()));
           });
            },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
