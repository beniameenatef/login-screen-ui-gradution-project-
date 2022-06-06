import 'package:design_ui/models/oneyearmodel.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:design_ui/network/http/HttpPut.dart';
import 'package:flutter/material.dart';

import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../network/http/HttpPost.dart';
import '../ScreenPageDrawer/العام الاكاديمي.dart';
class AddEditOneYearScreen extends StatefulWidget {
  const AddEditOneYearScreen({Key? key,this.object}) : super(key: key);
  final Datumm? object;


  @override
  _AddEditOneYearScreenState createState() => _AddEditOneYearScreenState();
}

class _AddEditOneYearScreenState extends State<AddEditOneYearScreen> {
  TextEditingController _YearController= TextEditingController();

  late Future<Oneyear> oneyear;
  String AlertText= ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oneyear =GetOneYears();
    _YearController= TextEditingController(text: widget.object?.attributes?.year);


  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

        title:(widget.object?.id == null)? Text('أضف الى العام الاكاديمى',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),):
        Text('تعديل الى العام الاكاديمى',style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xFFF1770D)),)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            SizedBox(height: 30,),
            DefaultTextField(
                controller: _YearController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل بعض البيانات';
                  }
                  return null;
                },
                text: 'ex:2018/2019 أدخل السنه بهذه الصيغه'

            ),
            SizedBox(height: 30,),
            DefaultButton(
              text: (widget.object?.id==null)?'أضف':'تعديل',
              color: AppColors.blue,
              onpressed:() {
                setState(() {

                  final FormState? form = formKey.currentState;
                  if(widget.object?.id==null)  {
                    if(form!.validate())
                    {
                      oneyear = PostOneYear(_YearController.text);
                      AlertText = 'تم الاضافة';
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => new Al3am_Alacademy()));                    }
                    else
                    {
                      AlertText = 'ادخل بعض البيانات';
                    }

                  }
                  else{
                    if(form!.validate())
                    {
                      oneyear =  PutOneYear(widget.object!.id!,_YearController.text);
                      AlertText = 'تم التعديل';
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => new Al3am_Alacademy()));

                    }

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
