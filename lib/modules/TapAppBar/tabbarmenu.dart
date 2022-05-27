import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../TapAppBar/carousselSlider.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit,qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = homecubit.get(context);

        return
          Container(

          padding: const EdgeInsetsDirectional.all(8),
          child: ContainedTabBarView(
            tabBarProperties: const TabBarProperties(
              unselectedLabelColor: Color(0xff9a9a9d),
              labelColor: Color(0xFF054978),
              labelPadding: EdgeInsets.zero,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsetsDirectional.all(10),
              indicatorColor: Color(0xFFF1770D),
            ),
            tabs: const [
              Text(
                'Overview',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Charts',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Tables',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600),
              ),
            ],
            views: const [
              Caroussel(),
              Caroussel(),
              Caroussel(),
            ],
            onChange: (index)
          {
            cubit.Homechangetapappbar(index);

          },
          ),
        );
      },
    );
  }
}
