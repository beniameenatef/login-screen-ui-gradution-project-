import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/userdata.dart';

class detailshomePage extends StatelessWidget {
  const detailshomePage({Key? key,this.role}) : super(key: key);
  final String? role;

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = new TextEditingController();
    String _searchText = "";
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubitnavbar = homecubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white24,
            elevation: 0,
            bottomOpacity: 0,
            toolbarHeight: 80,
            leading: (role == null)? IconButton(
              color: Color(0xFF2F2F31),
              onPressed: () {
                print('Presionando');
                AppDrawer.of(context)?.toggle();
              },
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
            ):
            IconButton(
              color: Color(0xFF2F2F31),
              onPressed: () {
                print('guest');
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_sharp,
                size: 30,
              ),
            )
            ,
            titleSpacing: 0,
            title: Row(
              children: [
                const Text(
                  'QMS',
                  style: TextStyle(color: Color(0xFFF1770D)),
                ),


              ],
            ),
            actions: [
              IconButton(onPressed: (){
                GetUserData(jwt);

              }, icon: Icon(Icons.keyboard_option_key))
            ],
          ),
          body: cubitnavbar.screenNavigationbar[cubitnavbar.currentindexnavbar],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: cubitnavbar.currentindexnavbar,
            onTap: (index) {
              cubitnavbar.changebottomnavifationbar(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings'),
            ],
          ),
        );
      },
    );
  }
}
