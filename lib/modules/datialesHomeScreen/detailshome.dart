import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class detailshomePage extends StatelessWidget {
  const detailshomePage({Key? key}) : super(key: key);

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
            title: Row(
              children: [
                const Text(
                  'QMS',
                  style: TextStyle(color: Color(0xFFF1770D)),
                ),
                const Expanded(
                  child: SizedBox(
                    width: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 10),
                  child: SizedBox(
                      width: 250.0,
                      height: 37,
                      child: TextField(
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
                      )),
                )
              ],
            ),
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
