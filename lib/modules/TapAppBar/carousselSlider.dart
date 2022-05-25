import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Caroussel extends StatelessWidget {
  const Caroussel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<homecubit,qualityhomestates>
      (listener: (context, state)
    {

    },
        builder: (context,state)
        {
          var cubit =homecubit.get(context);
          return Scaffold(
            body: cubit.screentabbar[cubit.currnetindextabbar],
          ) ;


    });
  }
}
