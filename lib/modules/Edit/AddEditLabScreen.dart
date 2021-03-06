import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../models/Mstaffmodel.dart';
import '../../models/labmodel.dart';
import '../../network/http/HttpGet.dart';
import '../../network/http/HttpSearch.dart';
<<<<<<< Updated upstream
import '../Drawer/drawer.dart';
import '../datialesHomeScreen/detailshome.dart';
class AddEditLabScreen extends StatefulWidget {
  const AddEditLabScreen({Key? key}) : super(key: key);
=======
import '../ScreenPageDrawer/المعامل.dart';

class AddEditLabScreen extends StatefulWidget {
  const AddEditLabScreen({Key? key, this.object}) : super(key: key);
  final Datumlab? object;
>>>>>>> Stashed changes

  @override
  _AddEditLabScreenState createState() => _AddEditLabScreenState();
}
class _AddEditLabScreenState extends State<AddEditLabScreen> {

  TextEditingController _LabNumberController = TextEditingController();
  TextEditingController _PCNumberController = TextEditingController();
  late Future<Lab> lab;
  late Future<Mstaff> mstaff;
  String AlertText = ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String? selectedValue;
  late int? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lab = GetLab();
<<<<<<< Updated upstream
    mstaff=GetMstaff();

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
              Navigator.pop(context);

            },icon: Icon(Icons.arrow_back_ios,color: Color(0xFFF1770D),),
            ),),
          titleSpacing: 0,

          title:Text('أضف الى المعامل',style: TextStyle(fontWeight: FontWeight.bold,
              color: Color(0xFFF1770D)),),
        ),
        body: FutureBuilder<Mstaff>(
            future: mstaff,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Dattum>? mstaffs = snapshot.data!.data;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(children: [
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _LabNumberController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'رقم المعمل'

                        ),
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _PCNumberController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'عدد الاجهزة'
=======
    mstaff = GetMstaff();
    _LabNumberController =
        TextEditingController(text: widget.object?.attributes!.labNumber);
    _PCNumberController =
        TextEditingController(text: widget.object?.attributes!.pCnumber);
    selectedValue = widget.object?.attributes?.mid?.data?.attributes?.name;
    id=widget.object?.attributes?.mid?.data?.id;
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Color(0xFF054978),
                leadingWidth: 40,
                leading: Padding(
                  padding: EdgeInsetsDirectional.only(start: 10),
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
                  'أضف الى المعامل',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1770D)),
                )
                    : const Text(
                  'تعديل المعامل',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1770D)),
                )),
            body: FutureBuilder<Mstaff>(
                future: mstaff,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Dattum>? mstaffs = snapshot.data!.data;
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
                              DefaultTextField(
                                  controller: _LabNumberController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'رقم المعمل'),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultTextField(
                                  controller: _PCNumberController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل بعض البيانات';
                                    }
                                    return null;
                                  },
                                  text: 'عدد الاجهزة'),
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
                                          'مسئول المعمل',
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
                                  items: mstaffs!
                                      .map((item) => DropdownMenuItem(
                                    value: item.attributes!.name,
                                    child: Text(
                                      ("${item.attributes!.name.toString()}"),
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
>>>>>>> Stashed changes

                                      Future<int> data =
                                      SearchMstaff(value.toString());
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
<<<<<<< Updated upstream
                              ],
                            ), items: mstaffs?.map((item) => DropdownMenuItem(
                            value: item.attributes!.name,
                            child: Text(
                              ("${item.attributes!.name.toString()}"),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
=======
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              DefaultButton(
                                text: (widget.object?.id == null)
                                    ? 'أضف'
                                    : 'تعديل',
>>>>>>> Stashed changes
                                color: AppColors.blue,
                                onpressed: () {
                                  setState(() {
                                    final FormState? form =
                                        formKey.currentState;
                                    if (widget.object?.id == null) {
                                      if (form!.validate()) {
                                        homecubit.get(context).PostLab(
                                            labnumber:
                                            _LabNumberController.text,
                                            pcnumber: _PCNumberController.text,
                                            id: id!);
                                        AlertText = 'تم الاضافة';
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                new Alma3amel()));
                                      } else {
                                        AlertText = 'ادخل بعض البيانات';
                                      }
                                    } else {
                                      if (form!.validate()) {
                                        homecubit.get(context).PutLab(
                                            id: widget.object!.id!,
                                            labnumber:
                                            _LabNumberController.text,
                                            pcnumber: _PCNumberController.text,
                                            id2: id!);
                                        AlertText = 'تم التعديل';
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                new Alma3amel()));
                                      }
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('${AlertText}'),
                            ],
                          ),
                        ),
<<<<<<< Updated upstream
                        SizedBox(height: 30,),
                        DefaultButton(
                          text: 'أضف',
                          color: AppColors.blue,
                          onpressed:() {
                            setState(() {

                              final FormState? form = formKey.currentState;
                              if(form!.validate())
                              {
                                lab = PostLab(_LabNumberController.text, _PCNumberController.text, id!);
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