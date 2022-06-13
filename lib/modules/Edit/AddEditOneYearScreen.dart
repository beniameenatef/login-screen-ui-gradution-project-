
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../models/oneyearmodel.dart';
import '../../network/http/HttpGet.dart';
import '../../network/http/HttpPost.dart';
import '../ScreenPageDrawer/العام الاكاديمي.dart';

class AddEditOneYearScreen extends StatefulWidget {
  const AddEditOneYearScreen({Key? key, this.object}) : super(key: key);
  final Datumm? object;

  @override
  _AddEditOneYearScreenState createState() => _AddEditOneYearScreenState();
}

class _AddEditOneYearScreenState extends State<AddEditOneYearScreen> {
  TextEditingController _YearController = TextEditingController();

  late Future<Oneyear> oneyear;
  String AlertText = ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oneyear = GetOneYears();
    _YearController =
        TextEditingController(text: widget.object?.attributes?.year);
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
                    color: const Color(0xFFF1770D),
                  ),
                ),
              ),
              titleSpacing: 0,
              title: (widget.object?.id == null)
                  ? const Text(
                'أضف الى العام الاكاديمى',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF1770D)),
              )
                  : const Text(
                'تعديل الى العام الاكاديمى',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF1770D)),
              )),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultTextField(
                      controller: _YearController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل بعض البيانات';
                        }
                        return null;
                      },
                      text: 'ex:2018/2019 أدخل السنه بهذه الصيغه'),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultButton(
                    text: (widget.object?.id == null) ? 'أضف' : 'تعديل',
                    color: AppColors.blue,
                    onpressed: () {
                      setState(() {
                        final FormState? form = formKey.currentState;
                        if (widget.object?.id == null) {
                          if (form!.validate()) {
                            homecubit
                                .get(context)
                                .PostOneYear(year: _YearController.text);
                            AlertText = 'تم الاضافة';
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    new Al3am_Alacademy()));
                          } else {
                            AlertText = 'ادخل بعض البيانات';
                          }
                        } else {
                          if (form!.validate()) {
                            homecubit.get(context).PutOneYear(
                                id: widget.object!.id!,
                                year: _YearController.text);
                            AlertText = 'تم التعديل';
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    new Al3am_Alacademy()));
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
          ),
        );
      },
    );
  }
}