import 'package:design_ui/models/surveymodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../network/http/HttpGet.dart';
import '../ScreenPageDrawer/الاستطلاعات.dart';

class AddEditSurveyScreen extends StatefulWidget {
  const AddEditSurveyScreen({Key? key, this.object}) : super(key: key);
  final DatumS? object;

  @override
  _AddEditSurveyScreenState createState() => _AddEditSurveyScreenState();
}

class _AddEditSurveyScreenState extends State<AddEditSurveyScreen> {
  TextEditingController _STypeController = TextEditingController();

  late Future<Surveys> survey;
  String AlertText = ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    survey = GetSurvey();
    _STypeController =
        TextEditingController(text: widget.object?.attributes!.sType);
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
                'أضف الى الاستطلاعات',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF1770D)),
              )
                  : const Text(
                'تعديل الاستطلاعات',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF1770D)),
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
                      controller: _STypeController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل بعض البيانات';
                        }
                        return null;
                      },
                      text: 'نوع الاستطلاع'),
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
                                .PostSurvey(Stype: _STypeController.text);
                            AlertText = 'تم الاضافة';
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new Alasttla3at()));
                          } else {
                            AlertText = 'ادخل بعض البيانات';
                          }
                        } else {
                          if (form!.validate()) {
                            homecubit.get(context).PutSurvey(
                                id: widget.object!.id!,
                                Stype: _STypeController.text);
                            AlertText = 'تم التعديل';
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new Alasttla3at()));
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