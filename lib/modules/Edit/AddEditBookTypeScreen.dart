import 'package:design_ui/models/bookTypemodel.dart';
import 'package:design_ui/network/http/HttpPost.dart';
import 'package:flutter/material.dart';

import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../network/http/HttpGet.dart';
class AddEditBookTypeScreen extends StatefulWidget {
  const AddEditBookTypeScreen({Key? key}) : super(key: key);

  @override
  _AddEditBookTypeScreenState createState() => _AddEditBookTypeScreenState();
}

class _AddEditBookTypeScreenState extends State<AddEditBookTypeScreen> {
  TextEditingController _BookTypeController= TextEditingController();

  late Future<Booktype> booktype;
  String AlertText= ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    booktype =GetBookType();

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

        title:Text('أضف الى انواع الكتب',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            SizedBox(height: 30,),
            DefaultTextField(
                controller: _BookTypeController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل بعض البيانات';
                  }
                  return null;
                },
                text: 'نوع الكتاب'

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
                    booktype = PostBookType(_BookTypeController.text);
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
