import 'package:design_ui/models/surveymodel.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:design_ui/network/http/HttpPost.dart';
import 'package:flutter/material.dart';

import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
class AddEditSurveyScreen extends StatefulWidget {
  const AddEditSurveyScreen({Key? key}) : super(key: key);

  @override
  _AddEditSurveyScreenState createState() => _AddEditSurveyScreenState();
}

class _AddEditSurveyScreenState extends State<AddEditSurveyScreen> {
  TextEditingController _STypeController= TextEditingController();

  late Future<Surveys> survey;
  String AlertText= ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    survey =GetSurvey();

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

        title:Text('أضف الى الاستطلاعات',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            SizedBox(height: 30,),
            DefaultTextField(
                controller: _STypeController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل بعض البيانات';
                  }
                  return null;
                },
                text: 'نوع الاستطلاع'

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
                    survey = PostSurvey(_STypeController.text);
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
}
