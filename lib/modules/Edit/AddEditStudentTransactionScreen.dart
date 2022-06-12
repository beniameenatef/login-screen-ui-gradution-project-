<<<<<<< Updated upstream
import 'package:design_ui/models/studenttransactionmodel.dart';
import 'package:design_ui/models/surveyitemmodel.dart';
import 'package:design_ui/network/http/HttpPost.dart';
=======
>>>>>>> Stashed changes
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../models/oneyearmodel.dart';
import '../../models/studenttransactionmodel.dart';
import '../../models/surveyitemmodel.dart';
import '../../network/http/HttpGet.dart';
import '../../network/http/HttpSearch.dart';
<<<<<<< Updated upstream
class AddEditStudentTransactionScreen extends StatefulWidget {
  const AddEditStudentTransactionScreen({Key? key}) : super(key: key);
=======
import '../ScreenPageDrawer/معاملات الطلاب.dart';

class AddEditStudentTransactionScreen extends StatefulWidget {
  const AddEditStudentTransactionScreen({Key? key, this.object})
      : super(key: key);
  final StudentTransactionData? object;
>>>>>>> Stashed changes

  @override
  _AddEditStudentTransactionScreenState createState() =>
      _AddEditStudentTransactionScreenState();
}

class _AddEditStudentTransactionScreenState
    extends State<AddEditStudentTransactionScreen> {
  TextEditingController _PercentageController = TextEditingController();

  late Future<StudentTransaction> studenttransaction;
  late Future<Oneyear> year;
  late Future<SurveyItems> surveyitems;
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
    studenttransaction=GetStudentTransaction();
    surveyitems =GetSurveyItem();

=======
    studenttransaction = GetStudentTransaction();
    surveyitems = GetSurveyItem();
    _PercentageController = TextEditingController(
        text: widget.object?.attributes!.Percentage.toString());
    selectedValue =
        widget.object?.attributes?.academicYear?.data?.attributes?.Year;
    selectedValue2 =
        widget.object?.attributes?.surveyItem?.data?.attributes?.Description;
    id = widget.object?.attributes?.academicYear?.data?.id;
    id2 = widget.object?.attributes?.surveyItem?.data?.id;
>>>>>>> Stashed changes
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: const Color(0xFF054978),
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
                  'أضف الى معاملات الطلاب',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1770D)),
                )
                    : const Text(
                  'تعديل معاملات الطلاب',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1770D)),
                )),
            body: FutureBuilder(
                future: Future.wait([year, surveyitems]),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    List<Datumm>? years = snapshot.data![0]!.data;
                    List<Datuum>? surveyitemss = snapshot.data![1].data;
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              const SizedBox(
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

<<<<<<< Updated upstream
          title:Text('أضف الى معاملات الطلاب',style: TextStyle(fontWeight: FontWeight.bold,
              color: Color(0xFFF1770D)),),
        ),
        body: FutureBuilder(
            future: Future.wait([year,surveyitems]),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                List<Datumm>? years = snapshot.data![0]!.data;
                List<Datuum>? surveyitemss = snapshot.data![1].data;
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
                                    'السنة',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
=======
                                      Future<int> data =
                                      SearchOneYear(value.toString());
                                      print(data);
                                      data
                                          .then((int value) => (id = value))
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
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.black45,
>>>>>>> Stashed changes
                                    ),
                                    color: Colors.white,
                                  ),
                                  buttonElevation: 0,
                                  itemHeight: 45,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 350,
                                  dropdownPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                              const SizedBox(
                                height: 30,
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2<dynamic>(
                                  isExpanded: true,
                                  hint: Row(
                                    children: const [
                                      Expanded(
                                        child: Text(
                                          'البند',
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
                                  items: surveyitemss
                                      ?.map((item) => DropdownMenuItem(
                                    value: item.attributes!.description,
                                    child: Text(
                                      ("${item.attributes!.description.toString()}"),
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
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue2 = value as String;

                                      Future<int> data =
                                      SearchSurveyItem(value.toString());
                                      print(data);
                                      data
                                          .then((int value) => (id2 = value))
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
                                  buttonHeight: 90,
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
                                  itemHeight: 55,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownMaxHeight: 300,
                                  dropdownWidth: 350,
                                  dropdownPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultTextField(
                                  controller: _PercentageController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'النسبة'),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultButton(
                                text: (widget.object?.id == null)
                                    ? 'أضف'
                                    : 'تعديل',
                                color: AppColors.blue,
                                onpressed: () {
                                  setState(() {
                                    final FormState? form =
                                        formKey.currentState;
                                    if (widget.object?.id == null) {
                                      if (form!.validate()) {
                                        homecubit
                                            .get(context)
                                            .PostStudentTransaction(
                                            percentage: int.parse(
                                                _PercentageController.text),
                                            year: id!,
                                            survey: id2!);
                                        AlertText = 'تم الاضافة';
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                new Mo3amalatALtolap()));
                                      } else {
                                        AlertText = 'ادخل بعض البيانات';
                                      }
                                    } else {
                                      if (form!.validate()) {
                                        homecubit
                                            .get(context)
                                            .PutStudentTransaction(
                                            id: widget.object!.id!,
                                            percentage: int.parse(
                                                _PercentageController.text),
                                            year: id!,
                                            survey: id2!);
                                        AlertText = 'تم التعديل';
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                new Mo3amalatALtolap()));
                                      }
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('${AlertText}'),
                            ],
                          ),
                        ),
<<<<<<< Updated upstream
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _PercentageController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'النسبة'

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
                                studenttransaction=PostStudentTransaction(int.parse(_PercentageController.text), id!, id2!);
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
=======
>>>>>>> Stashed changes
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