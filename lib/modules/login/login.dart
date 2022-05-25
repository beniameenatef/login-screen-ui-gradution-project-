import 'package:design_ui/bloc/login/cubitlogin.dart';
import 'package:design_ui/bloc/login/stateslogin.dart';
import 'package:design_ui/components/passwordtextform.dart';
import 'package:design_ui/constant/colors.dart';
import 'package:design_ui/components/custom%20button.dart';
import 'package:design_ui/components/text%20from.dart';
import 'package:design_ui/modules/login/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class loginqualityapp extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var emaillogincontroller = TextEditingController();
  var passwordlogincontroller = TextEditingController();
  bool obserText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => logincubit(),
        child: BlocConsumer<logincubit, qualityloginstates>(
            listener: (context, state) {},
            builder: (context, state) {
              var visibalcubit = logincubit.get(context);

              return Scaffold(
                appBar: null,
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Form(
                          key: formkey,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.asset(
                                    'assets/image/qualitylogo.jpg',
                                    width: 250,
                                    height: 150),
                              ),
                              const SizedBox(
                                height: 40,
                              ),

                              const Text(
                                'Welcome To ',
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),

                              const Text(
                                'Quality Management System ',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const Text(
                                'For Faculty of CsIs  ',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              DefaultTextField(
                                controller: emaillogincontroller,
                                text: 'email',
                                prefix: Icons.email,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return ('amail address must not be empty');
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              PasswordTextFormField(
                                prefix: Icons.lock_outline,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return ('password must not be empty');
                                  }
                                  return null;
                                },
                                obserText: obserText,
                                controller: passwordlogincontroller,
                                suffixPressed: () {
                                  FocusScope.of(context).unfocus();
                                  obserText = !obserText;
                                  visibalcubit.visibal();
                                },
                                text: 'Password',
                              ),
                              // DefaultTextField(
                              //   controller:passwordlogincontroller ,
                              //   label: 'password',
                              //   prefix: Icons.lock_outline,
                              //   suffix: Icons.visibility,
                              //     // obserText: true,
                              //
                              //     suffixPressed: ()
                              //   {
                              //
                              //     setState(() {
                              //         ispassword=!ispassword;
                              //       });
                              //     },
                              //
                              //   validate:(value){
                              //     if (value!.isEmpty) {
                              //       return ('password must not be empty');
                              //     }
                              //     return null;
                              //   },
                              //
                              // ),

                              const SizedBox(
                                height: 20,
                              ),

                              Center(
                                  child: DefaultButton(
                                text: 'Login',
                                color: AppColors.orange,
                                onpressed: () {
                                  if (formkey.currentState!.validate()) {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => homescreen()),
                                    // );

                                  }
                                },
                              )),
                              const SizedBox(
                                height: 11,
                              ),
                              Center(
                                  child: DefaultButton(
                                text: 'Guest User',
                                color: AppColors.blue,
                                onpressed: () {},
                              )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account?',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                regestersocialapp()),
                                      );
                                    },
                                    child: const Text(
                                      'Register Now',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: AppColors.blue,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
