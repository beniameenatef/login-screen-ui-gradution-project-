import 'dart:convert';

<<<<<<< Updated upstream
import 'package:design_ui/models/bookTypemodel.dart';
import 'package:design_ui/models/modelMaktba.dart';
import 'package:design_ui/models/oneyearmodel.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:design_ui/network/http/HttpPost.dart';
=======

>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../models/bookTypemodel.dart';
import '../../models/modelMaktba.dart';
import '../../models/oneyearmodel.dart';
import '../../network/http/HttpGet.dart';
import '../../network/http/HttpSearch.dart';

class AddEditLibraryScreen extends StatefulWidget {
<<<<<<< Updated upstream
  const AddEditLibraryScreen({Key? key}) : super(key: key);
=======
  AddEditLibraryScreen({Key? key, this.object}) : super(key: key);
  final Datum? object;
>>>>>>> Stashed changes

  @override
  _AddEditLibraryScreenState createState() => _AddEditLibraryScreenState();
}

class _AddEditLibraryScreenState extends State<AddEditLibraryScreen> {
  @override
  TextEditingController _NumberController = TextEditingController();

  late Future<Library> library;
  late Future<Oneyear> year;
  late Future<Booktype> booktype;
  String AlertText = ' ';
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
<<<<<<< Updated upstream
    booktype=GetBookType();
    library =GetLibrary();
=======
    booktype = GetBookType();
    library = GetLibrary();
>>>>>>> Stashed changes

    _NumberController =
        TextEditingController(text: widget.object?.attributes!.number);
    selectedValue =
        widget.object?.attributes?.academicYear?.data?.attributes?.year;
    selectedValue2 =
        widget.object?.attributes?.bookType?.data?.attributes?.type;
    id = widget.object?.attributes?.academicYear?.data?.id;
    id2 = widget.object?.attributes?.bookType?.data?.id;
  }

<<<<<<< Updated upstream
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
=======
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Color(0xFF054978),
                leadingWidth: 40,
                leading: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFFF1770D),
                    ),
                  ),
                ),
                titleSpacing: 0,
                title: (widget.object?.id == null)
                    ? const Text(
                  'أضف الى المكتبة',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1770D)),
                )
                    : const Text(
                  'تعديل المكتبة',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1770D)),
                )),
            body: FutureBuilder(
                future: Future.wait([year, booktype]),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    List<Datumm>? years = snapshot.data![0]!.data;
                    List<Ddatum>? booktypes = snapshot.data![1].data;
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
>>>>>>> Stashed changes
                              ),
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
                                  ),
                                  items: booktypes
                                      ?.map(
                                        (item) => DropdownMenuItem(
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
                                    ),
                                  )
                                      .toList(),
                                  value: selectedValue2,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue2 = value as String;
                                      Future<int> data =
                                      SearchBooktype(value.toString());
                                      print(data);
                                      data.then((int value) {
                                        id2 = value;

                                        // homecubit.get(context)..PostLibrary();

                                        // homecubit
                                        //     .get(context)
                                        //     .PostLibrary(idbook: id2);
                                      }).catchError((e) => 499);
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
                                  dropdownWidth: 350,
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
                                ),
                              ),
<<<<<<< Updated upstream
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
=======
                              SizedBox(
                                height: 30,
                              ),
                              DefaultTextField(
                                  controller: _NumberController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                  },
                                  text: 'العدد'),
                              SizedBox(
                                height: 30,
                              ),
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
                                  ),
                                  items: years
                                      ?.map((item) => DropdownMenuItem(
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
                                  onChanged: (value) {
                                    setState(() {

                                      selectedValue = value as String;

                                      Future<int> data =
                                      SearchOneYear(value.toString());
                                      print(data);
                                      data.then((int value) {
                                        id = value;
                                        // homecubit.get(context).PostLibrary();
                                        // homecubit
                                        //     .get(context)
                                        //     .PostLibrary(idyear: id);
                                      }).catchError((e) => 499);

                                      // id = data;
>>>>>>> Stashed changes

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
                                  dropdownWidth: 350,
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
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              DefaultButton(
                                text: (widget.object?.id == null)
                                    ? 'أضف'
                                    : 'تعديل',
                                color: AppColors.blue,
                                onpressed: () {
                                  // setState(() {

                                  final FormState? form = formKey.currentState;
                                  if (widget.object?.id == null) {
                                    if (form!.validate()) {
                                      // library=PostLibrary(int.parse(_NumberController.text), id!, id2!);
                                      homecubit.get(context).PostLibrary(
                                          num:
                                          int.parse(_NumberController.text),
                                          idbook: id2,
                                          idyear: id);
                                      AlertText = 'تم الاضافة';
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              new Almaktba()));
                                    } else {
                                      AlertText = 'ادخل بعض البيانات';
                                    }
                                  } else {
                                    if (form!.validate()) {
                                      // id = data;
                                      // id = data;

                                      homecubit.get(context).PutLibrary(
                                          id: widget.object!.id,
                                          num:
                                          int.parse(_NumberController.text),
                                          idyear: id,
                                          idbook: id2);

                                      AlertText = 'تم التعديل';
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              new Almaktba()));
                                    }
                                  }

                                  // homecubit.get(context).model

                                  // homecubit.get(context).PostLibrary(
                                  //     num: int.parse(_NumberController.text),
                                  //     idbook: id2,
                                  //     idyear: id
                                  // );
                                  // });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('${AlertText}'),
                            ],
                          ),
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
                }));
      },
    );
  }
}