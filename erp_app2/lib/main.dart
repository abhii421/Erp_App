
import 'package:erp_app2/hidden_drawer.dart';
import 'package:erp_app2/screens/Login.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hunch App',
      // home: StreamBuilder(
      //   stream: _auth.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return CircularProgressIndicator();
      //     } else {
      //       // Show loading indicator or splash screen while checking authentication state
      //       if (snapshot.hasData) {
      //         // User is authenticated, navigate to Homepage
      //         return HomeScreen();
      //       } else {
      //         // User is not authenticated, navigate to Login page
      //         return Login();
      //       }
      //     }
      //   },
      // ),

      home: HiddenDrawer(),
    );
  }
}
