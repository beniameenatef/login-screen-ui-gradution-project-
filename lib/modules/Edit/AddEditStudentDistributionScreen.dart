import 'package:design_ui/models/studentdistribution.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../models/oneyearmodel.dart';
import '../../network/http/HttpGet.dart';
import '../../network/http/HttpSearch.dart';
<<<<<<< Updated upstream
class AddEditStudentDistributionScreen extends StatefulWidget {
  const AddEditStudentDistributionScreen({Key? key}) : super(key: key);
=======
import '../ScreenPageDrawer/توزيع الطلاب.dart';

class AddEditStudentDistributionScreen extends StatefulWidget {
  const AddEditStudentDistributionScreen({Key? key, this.object})
      : super(key: key);
  final DatumSD? object;
>>>>>>> Stashed changes

  @override
  _AddEditStudentDistributionScreenState createState() =>
      _AddEditStudentDistributionScreenState();
}

class _AddEditStudentDistributionScreenState
    extends State<AddEditStudentDistributionScreen> {
  TextEditingController _CSController = TextEditingController();
  TextEditingController _ISController = TextEditingController();
  TextEditingController _AIController = TextEditingController();
  TextEditingController _NIController = TextEditingController();
  TextEditingController _GeneralController = TextEditingController();
  TextEditingController _MaleController = TextEditingController();
  TextEditingController _FemaleController = TextEditingController();
  TextEditingController _LevelController = TextEditingController();

  late Future<Oneyear> year;
  late Future<StudentDistribution> studentdistribution;
  String AlertText = ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String? selectedValue;
  late int? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    year = GetOneYears();
<<<<<<< Updated upstream
    studentdistribution =GetStudentDistrubtion();

=======
    studentdistribution = GetStudentDistrubtion();
    _GeneralController =
        TextEditingController(text: widget.object?.attributes!.general?.number);
    _NIController =
        TextEditingController(text: widget.object?.attributes!.ni?.number);
    _AIController =
        TextEditingController(text: widget.object?.attributes!.ai?.number);
    _ISController = TextEditingController(
        text: widget.object?.attributes!.attributesIs?.number);
    _CSController =
        TextEditingController(text: widget.object?.attributes!.cs?.number);
    _FemaleController =
        TextEditingController(text: widget.object?.attributes!.female);
    _MaleController =
        TextEditingController(text: widget.object?.attributes!.male);
    _LevelController = TextEditingController(
        text: widget.object?.attributes!.level.toString());
    selectedValue = widget.object?.attributes?.year?.data?.attributes?.year;
    id = widget.object?.attributes?.year?.data?.id;
>>>>>>> Stashed changes
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
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

          title:Text('أضف الى توزيع الطلاب',style: TextStyle(fontWeight: FontWeight.bold,
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
                  'أضف الى توزيع الطلاب',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1770D)),
                )
                    : const Text(
                  'تعديل توزيع الطلاب',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1770D)),
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
                                  controller: _LevelController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'المستوى'),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultTextField(
                                  controller: _MaleController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'بنين'),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultTextField(
                                  controller: _FemaleController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'بنات'),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultTextField(
                                  controller: _CSController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'CS'),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultTextField(
                                  controller: _ISController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'IS'),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultTextField(
                                  controller: _AIController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'AI'),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultTextField(
                                  controller: _NIController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'NI'),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultTextField(
                                  controller: _GeneralController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'عام'),
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
                                            .PostStudentDistribution(
                                            year: id!,
                                            level: int.parse(
                                                _LevelController.text),
                                            male: _MaleController.text,
                                            female: _FemaleController.text,
                                            cs: _CSController.text,
                                            Is: _ISController.text,
                                            ai: _AIController.text,
                                            ni: _NIController.text,
                                            general:
                                            _GeneralController.text);
                                        AlertText = 'تم الاضافة';
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                new Tawzee3Altolap()));
                                      } else {
                                        AlertText = 'ادخل بعض البيانات';
                                      }
                                    } else {
                                      if (form!.validate()) {
                                        homecubit
                                            .get(context)
                                            .PutStudentDistribution(
                                            id: widget.object!.id!,
                                            year: id!,
                                            level: int.parse(
                                                _LevelController.text),
                                            male: _MaleController.text,
                                            female: _FemaleController.text,
                                            cs: _CSController.text,
                                            Is: _ISController.text,
                                            ai: _AIController.text,
                                            ni: _NIController.text,
                                            general:
                                            _GeneralController.text);
                                        AlertText = 'تم التعديل';
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                new Tawzee3Altolap()));
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
                            controller: _LevelController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'المستوى'

                        ),
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _MaleController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'بنين'

                        ),
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _FemaleController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'بنات'

                        ),
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _CSController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'CS'

                        ),
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _ISController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'IS'

                        ),
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _AIController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'AI'

                        ),
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _NIController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'NI'

                        ),
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _GeneralController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'عام'

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
                                studentdistribution=PostStudentDistribution(id!,int.parse(_LevelController.text) , _MaleController.text, _FemaleController.text, _CSController.text, _ISController.text, _AIController.text, _NIController.text, _GeneralController.text);
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