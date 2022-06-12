<<<<<<< Updated upstream
import 'package:design_ui/models/studentactivitymodel.dart';
import 'package:design_ui/network/http/HttpGet.dart';
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
import '../../models/studentactivitymodel.dart';
import '../../network/http/HttpGet.dart';
import '../../network/http/HttpSearch.dart';
<<<<<<< Updated upstream
class AddEditStudentActivityScreen extends StatefulWidget {
  const AddEditStudentActivityScreen({Key? key}) : super(key: key);
=======
import '../ScreenPageDrawer/نشاط الطلاب.dart';

class AddEditStudentActivityScreen extends StatefulWidget {
  const AddEditStudentActivityScreen({Key? key, this.object}) : super(key: key);
  final DatumSA? object;
>>>>>>> Stashed changes

  @override
  _AddEditStudentActivityScreenState createState() =>
      _AddEditStudentActivityScreenState();
}

class _AddEditStudentActivityScreenState
    extends State<AddEditStudentActivityScreen> {
  TextEditingController _TotalController = TextEditingController();
  TextEditingController _NumberController = TextEditingController();
  TextEditingController _PercentageController = TextEditingController();

  late Future<StudentActivity> studentactivity;
  late Future<Oneyear> year;
  String AlertText = ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String? selectedValue;
  late int? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentactivity = GetStudentActivity();
<<<<<<< Updated upstream
    year=GetOneYears();

=======
    year = GetOneYears();
    _TotalController =
        TextEditingController(text: widget.object?.attributes!.total);
    _NumberController =
        TextEditingController(text: widget.object?.attributes!.number);
    _PercentageController = TextEditingController(
        text: widget.object?.attributes!.percentage.toString());
    selectedValue = widget.object?.attributes?.year?.data?.attributes?.year;
    id = widget.object?.attributes?.year?.data?.id;
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
                  'أضف الى الانشطة',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1770D)),
                )
                    : const Text(
                  'تعديل الانشطة',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFF1770D)),
                )),
            body: FutureBuilder<Oneyear>(
                future: year,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Datumm>? years = snapshot.data!.data;
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
          title:Text('أضف الى الانشطة',style: TextStyle(fontWeight: FontWeight.bold,
              color: Color(0xFFF1770D)),),
        ),
        body: FutureBuilder<Oneyear>(
            future: year,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Datumm>? years = snapshot.data!.data;
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
                              DefaultTextField(
                                  controller: _NumberController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'العدد'),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultTextField(
                                  controller: _TotalController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'المجموع'),
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
                                            .PostStudentActivity(
                                            total: _TotalController.text,
                                            number: _NumberController.text,
                                            percentage:
                                            _PercentageController.text,
                                            id: id!);
                                        AlertText = 'تم الاضافة';
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                new NashatAtolap()));
                                      } else {
                                        AlertText = 'ادخل بعض البيانات';
                                      }
                                    } else {
                                      if (form!.validate()) {
                                        homecubit
                                            .get(context)
                                            .PutStudentActivity(
                                            id: widget.object!.id!,
                                            total: _TotalController.text,
                                            number: _NumberController.text,
                                            percentage:
                                            _PercentageController.text,
                                            id2: id!);
                                        AlertText = 'تم التعديل';
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                new NashatAtolap()));
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
                        DefaultTextField(
                            controller: _TotalController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'المجموع'

                        ),
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
                                studentactivity=PostStudentActivity(_TotalController.text, _NumberController.text, _PercentageController.text, id!);
                                AlertText = 'تم الاضافة';
                                Navigator.pop(context);

                              }
                              else
                              {
                                AlertText = 'ادخل بعض البيانات';
                              }

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