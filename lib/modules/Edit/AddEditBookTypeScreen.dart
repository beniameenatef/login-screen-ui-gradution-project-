<<<<<<< Updated upstream
import 'package:design_ui/models/bookTypemodel.dart';
import 'package:design_ui/network/http/HttpPost.dart';
=======
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home/homecubit.dart';
import '../../bloc/home/homestate.dart';
import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../models/bookTypemodel.dart';
import '../../network/http/HttpGet.dart';
<<<<<<< Updated upstream
class AddEditBookTypeScreen extends StatefulWidget {
  const AddEditBookTypeScreen({Key? key}) : super(key: key);
=======
import '../ScreenPageDrawer/انواع الكتب.dart';

class AddEditBookTypeScreen extends StatefulWidget {
  const AddEditBookTypeScreen({Key? key, this.object}) : super(key: key);
  final Ddatum? object;
>>>>>>> Stashed changes

  @override
  _AddEditBookTypeScreenState createState() => _AddEditBookTypeScreenState();
}

class _AddEditBookTypeScreenState extends State<AddEditBookTypeScreen> {
  TextEditingController _BookTypeController = TextEditingController();

  late Future<Booktype> booktype;
  String AlertText = ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
<<<<<<< Updated upstream
    booktype =GetBookType();

=======
    booktype = GetBookType();
    _BookTypeController =
        TextEditingController(text: widget.object?.attributes!.type);
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
=======
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
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFF1770D),
                  ),
                ),
              ),
              titleSpacing: 0,
              title: (widget.object?.id == null)
                  ? Text(
                'أضف الى انواع الكتب',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF1770D)),
              )
                  : Text(
                'تعديل انواع الكتب',
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
                  SizedBox(
                    height: 30,
                  ),
                  DefaultTextField(
                      controller: _BookTypeController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل بعض البيانات';
                        }
                        return null;
                      },
                      text: 'نوع الكتاب'),
                  SizedBox(
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
                                .PostBookType(name: _BookTypeController.text);
                            AlertText = 'تم الاضافة';
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new Anwa3elkotb()));
                          } else {
                            AlertText = 'ادخل بعض البيانات';
                          }
                        } else {
                          if (form!.validate()) {
                            homecubit.get(context).PutBookType(
                                id: widget.object!.id!,
                                name: _BookTypeController.text);
                            AlertText = 'تم التعديل';
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new Anwa3elkotb()));
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
          ),
        );
      },
>>>>>>> Stashed changes
    );
  }
}