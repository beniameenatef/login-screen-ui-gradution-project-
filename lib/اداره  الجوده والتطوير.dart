import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/TapAppBar/tabbarmenu.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/homecubit.dart';

class adaretalgouda extends StatelessWidget {
  const adaretalgouda({Key? key}) : super(key: key);

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
            leading: IconButton(
              color: Color(0xFF2F2F31),
              onPressed: () {
                print('Presionando');
                AppDrawer.of(context)?.toggle();
              },
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
            ),
            titleSpacing: 0,
            title: Padding(padding: EdgeInsetsDirectional.only(end: 10),
            child: Row(
              children: [
                const Text(
                  'أداره الجوده',
                  style: TextStyle(
                      fontSize: 15 ,
                      color: Color(0xFFF1770D)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(child:SizedBox(
                  width: 250.0,
                  height: 37,
                  child:   TextField(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //       builder: (context) => SearchScreen()),
                      // );
                    },
                    onSubmitted: (value) {},
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'searching',
                      hintStyle: TextStyle(fontSize: 15, height: 2.7),
                      // hintText: "Search",

                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 18,
                      ),

                      suffixIcon: _searchText.isNotEmpty
                          ? IconButton(
                        iconSize: 18,
                        icon: Icon(Icons.clear),
                        onPressed: () {},
                      )
                          : null,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                    ),
                  ) ,
                ),
                )
              ],
            ),)

          ),
          body: SelectionScreen(),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.grey,
            unselectedItemColor: Colors.grey,

            onTap: (index) {
              cubitnavbar.changebottomnavifationbar(index);
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context)=>detailshomePage()),
                        (route) => false);

            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.feedback), label: 'feedback'),
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
