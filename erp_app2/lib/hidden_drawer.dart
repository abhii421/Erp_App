import 'dart:ffi';
import 'package:erp_app2/screens/Homepage.dart';
import 'package:erp_app2/screens/settingpage.dart';
import 'package:erp_app2/signout.dart';
import 'package:erp_app2/test/test1.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HiddenDrawer extends StatefulWidget {
  final token;
  const HiddenDrawer({Key? key, this.token}): super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  late String email;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

    // email = jwtDecodedToken['email'];
      
   Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    email = jwtDecodedToken['email'] ?? 'DefaultEmail'; // Use a default value or handle it accordingly



    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          
        name: 'HomePage',
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
      ),

        ScreenHiddenDrawer(
        ItemHiddenMenu(
        name: 'SignOut',
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
        New(token: '')
         
      )
    ];
  }
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
       backgroundColorAppBar: Colors.cyan,
       disableAppBarDefault: false,
        actionsAppBar: <Widget>[
          
          

        ],
      

    
      backgroundColorMenu: Color.fromARGB(255, 199, 181, 246) ,
      screens: _pages, 
      initPositionSelected: 0,
      slidePercent: 50,
      contentCornerRadius: 25,
      boxShadow: [],


      
      );
  }
}