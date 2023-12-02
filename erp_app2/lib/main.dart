import 'package:erp_app2/hidden_drawer.dart';

import 'package:erp_app2/screens/Login.dart';
import 'package:erp_app2/signout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    token: prefs.getString('token'),
  ));
  print(prefs.getString('token'),
  );
}

class MyApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final token;

  const MyApp({
    @required this.token,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Erp App',
      home: (token != null && token is String)
          ? HiddenDrawer(token: token)
          : Login(),
    );
  }
}







