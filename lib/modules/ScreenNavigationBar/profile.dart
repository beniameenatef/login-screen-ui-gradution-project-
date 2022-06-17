import 'package:design_ui/models/userdatamodel.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../network/http/HttpPut.dart';
import '../login/userdata.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}
// String _currentSelectedValue='';

class _profileState extends State<profile> {
  late Future<List<Users>> users;
  var selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    users=GetUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Users>>(
      future: users,
      builder: (context, AsyncSnapshot<List<Users>> snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: (role=='guest')? Center(child: Text('Guest user'),) : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Divider(color: AppColors.blue,),
                  Text("Username",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blue,fontSize: 20),),
                  Text(username.toString(),style: TextStyle(fontWeight:FontWeight.w300,color: AppColors.blue,fontSize: 20),),
                  Divider(color: AppColors.blue,),
                  Text("Email",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blue,fontSize: 20),),
                  Text(email.toString(),style: TextStyle(fontWeight: FontWeight.w300,color: AppColors.blue,fontSize: 20),),
                  Divider(color: AppColors.blue,),
                  Visibility(
                    visible: (role=='admin')? true : false,
                    child: Column(
                      children: [
                        Text("Users",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blue,fontSize: 20),),
                        DataTable(
                          columnSpacing: 50.0,
                          columns: const [
                            DataColumn(label: Text('user')),
                            DataColumn(label: Text('role')),

                          ],
                          rows: List.generate(snapshot.data!.length,
                                  (index) {
                                dynamic x = snapshot.data?[index].username;
                                dynamic y = snapshot.data?[index].visible;
                                dynamic z = snapshot.data?[index].id;



                                return DataRow(
                                    cells: [
                                      DataCell(Container(child: (x==null)? Text("_"):Text("${x}"))),
                                      DataCell(Container(child:(y==null)? Text("_"): Text('${y}')),onTap: (){
                                        showDataAlert(x,z);
                                      }),

                                    ],

                                      // });
                                    );
                              }),
                        ),


                      ],
                    ),
                  ),





                ],
              ),
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

    );

  }

  showDataAlert(String username,int id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
            ),
            title: Text(
              "Manage Role for ${username}",
              style: TextStyle(fontSize: 24.0),
            ),
            content: Container(
              height: 200,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton2<dynamic>(
                              isExpanded: true,
                              hint: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      'choose role',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: ['creator1','creator2','guest']
                                  .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  ("${item}"),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blue,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )).toList(),
                              value: selectedValue,
                              onChanged: ( value) {
                                setState(() {
                                  state.setState(() {
                                    selectedValue = value as String;
                                    print(selectedValue);
                                    print(value);


                                  });

                                });
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: AppColors.blue,
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 70,
                              buttonWidth: double.infinity,
                              buttonPadding: const EdgeInsets.only(
                                  left: 14, right: 14),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.black45,
                                ),
                                color: Colors.white,
                              ),
                              buttonElevation: 0,
                              itemHeight: 45,
                              itemPadding: const EdgeInsets.only(
                                  left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 270,
                              dropdownPadding:
                              EdgeInsets.symmetric(horizontal: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            )
                          );


                        },
                      )
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {

                            PutUsers(id,selectedValue!);
                            print(selectedValue);
                            selectedValue=null;


                          });
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          // fixedSize: Size(250, 50),
                        ),
                        child: Text(
                          "Save",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}
