import 'dart:convert';

import 'package:design_ui/models/bookTypemodel.dart';
import 'package:design_ui/models/modelMaktba.dart';
import 'package:design_ui/models/oneyearmodel.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:design_ui/network/http/HttpPost.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../network/http/HttpSearch.dart';

class AddEditLibraryScreen extends StatefulWidget {
  const AddEditLibraryScreen({Key? key}) : super(key: key);

  @override
  _AddEditLibraryScreenState createState() => _AddEditLibraryScreenState();
}

class _AddEditLibraryScreenState extends State<AddEditLibraryScreen> {
  @override

  TextEditingController _NumberController= TextEditingController();


  late Future<Library> library;
  late Future<Oneyear> year;
  late Future<Booktype> booktype;
  String AlertText= ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String? selectedValue;
  String? selectedValue2;
  late int? id;
  late int? id2;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    year = GetOneYears();
    booktype=GetBookType();
    library =GetLibrary();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF054978),
        leadingWidth: 40,
        leading:Padding(padding: EdgeInsetsDirectional.only(start: 10),
          child:IconButton(onPressed: ()
          {
            Navigator.pop(context);

          },icon: Icon(Icons.arrow_back_ios,color: Color(0xFFF1770D),),
          ),),
        titleSpacing: 0,

        title:Text('أضف الى المكتبة',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),),
      ),
      body: FutureBuilder(
        future: Future.wait([year,booktype]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<Datumm>? years = snapshot.data![0]!.data;
            List<Ddatum>? booktypes = snapshot.data![1].data;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    key: formKey,
                    child: Column(children: [
                      SizedBox(height: 30,),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<dynamic>(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'نوع الكتاب',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ), items: booktypes?.map((item) => DropdownMenuItem(
                          value: item.attributes!.type,
                          child: Text(
                            ("${item.attributes!.type.toString()}"),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blue,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                            .toList(),
                          value: selectedValue2,
                          onChanged: (value)  {
                            setState(() {
                              selectedValue2 = value as String;

                              Future<int> data = SearchBooktype(value.toString());
                              print(data);
                              data.then((int value) => (id2=value))
                                  .catchError((e) => 499);
                              // id = data;

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
                          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black45,
                            ),
                            color: Colors.white,
                          ),
                          buttonElevation: 0,
                          itemHeight: 45,
                          itemPadding: const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownWidth: 350,
                          dropdownPadding: EdgeInsets.symmetric(horizontal: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(-20, 0),
                        ),
                      ),
                    SizedBox(height: 30,),
                    DefaultTextField(
                        controller: _NumberController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل بعض البيانات';
                          }
                          return null;
                        },
                        text: 'العدد'

                    ),
                    SizedBox(height: 30,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<dynamic>(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'السنة',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ), items: years?.map((item) => DropdownMenuItem(
                      value: item.attributes!.year,
                      child: Text(
                        ("${item.attributes!.year.toString()}"),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                    .toList(),
                value: selectedValue,
                onChanged: (value)  {
                  setState(() {
                    selectedValue = value as String;

                      Future<int> data = SearchOneYear(value.toString());
                      print(data);
                      data.then((int value) => (id=value))
                        .catchError((e) => 499);
                     // id = data;

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
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black45,
                  ),
                  color: Colors.white,
                ),
                buttonElevation: 0,
                itemHeight: 45,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 350,
                dropdownPadding: EdgeInsets.symmetric(horizontal: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(-20, 0),
              ),
            ),
          SizedBox(height: 30,),
          DefaultButton(
          text: 'أضف',
          color: AppColors.blue,
          onpressed:() {
          setState(() {

          final FormState? form = formKey.currentState;
          if(form!.validate())
          {
          library=PostLibrary(int.parse(_NumberController.text), id!, id2!);
          AlertText = 'تم الاضافة';
          }
          else
          {
          AlertText = 'ادخل بعض البيانات';
          }
          Navigator.pop(context);

          });

          },
          ),
          SizedBox(height: 10,),
          Text('${AlertText}'),
          ],),
          ),
          ),
          );
        }
        else if (snapshot.hasError) {
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
        }
        )



    );
  }

}
