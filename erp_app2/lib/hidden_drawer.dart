import 'dart:ffi';

import 'package:erp_app2/screens/Homepage.dart';
import 'package:erp_app2/screens/settingpage.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}): super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
        name: 'Homepage',
        baseStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,

        ), 
        selectedStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        colorLineSelected: const Color.fromARGB(255, 251, 162, 45)
        ),
        const Homepage(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
        name: 'Setting',
        baseStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ), 
        selectedStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,

        ),
         colorLineSelected: const Color.fromARGB(255, 251, 162, 45)
        ),
        const SettingPage(),
      )
    ];
  }
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Color.fromARGB(255, 199, 181, 246) ,
      screens: _pages, 
      initPositionSelected: 0,
      slidePercent: 50,
      contentCornerRadius: 25,
      boxShadow: [],


      
      );
  }
}