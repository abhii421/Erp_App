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









// import 'dart:convert';

// import 'package:erp_app2/hidden_drawer.dart';
// import 'package:erp_app2/screen2/adminpage.dart';

// import 'package:erp_app2/screens/Login.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   runApp(MyApp(
//     token: prefs.getString('token'),
//   ));

//     print(prefs.getString('token'),
//   );
// }

// class MyApp extends StatelessWidget {
//   final String? token;

//   const MyApp({
//     @required this.token,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (token != null && token is String) {
//       try {
//         // Decode the token to extract the role
//         Map<String, dynamic> tokenData = json.decode(token!);
//         String role = tokenData['role'];

//         switch (role) {
//           case 'admin':
//             return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: 'Erp App',
//               home: Admin_Page(), // Replace with your AdminPage
//             );
//           case 'student':
//             return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: 'Erp App',
//               home: HiddenDrawer(token: token),
//             );
//           default:
//             return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: 'Erp App',
//               home: Login(),
//             );
//         }
//       } catch (e) {
//         print('Error decoding token: $e');
//       }
//     }

//     // Token is not present or decoding failed
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Erp App',
//       home: Login(),
//     );
//   }
// }








// import 'package:erp_app2/hidden_drawer.dart';
// import 'package:erp_app2/screen2/adminpage.dart';
// import 'package:erp_app2/screen3/faculty_page.dart';
// import 'package:erp_app2/screens/Homepage.dart';
// import 'package:erp_app2/screens/Login.dart';
// import 'package:flutter/material.dart';


// class MyApp extends StatelessWidget {
//   final String? token; //ya to token ya null

//   const MyApp({
//     @required this.token,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (token != null && token is String) {
//       // Token is present
//       var role = ''; // Extract the role from  token 
      

//       switch (role) {
//         case 'admin':
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Erp App',
//             home: Admin_Page(), 
//           );
//         case 'student':
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Erp App',
//             home: HiddenDrawer(), 
//           );
//         case 'faculty':
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Erp App',
//             home: Faculty_Page(), 
//           );
//         default:
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Erp App',
//             home: Login(), 
//           );
//       }
//     } else {
//       // Token is not present
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Erp App',
//         home: Login(),
//       );
//     }
//   }
// }



// import 'dart:convert';
// import 'package:erp_app2/hidden_drawer.dart';
// import 'package:erp_app2/screen2/adminpage.dart';
// import 'package:erp_app2/screens/Login.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString('token');
//   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

//   runApp(MyApp(token: token, isLoggedIn: isLoggedIn));
// }

// class MyApp extends StatefulWidget {
//   final String? token;
//   final bool isLoggedIn;

//   MyApp({@required this.token, required this.isLoggedIn});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Erp App',
//       home: widget.isLoggedIn ? getHomeScreen() : Login(),
//     );
//   }

//   Widget getHomeScreen() {
//     if (widget.token != null && widget.token is String) {
//       try {
//         Map<String, dynamic> tokenData = json.decode(widget.token!);
//         String role = tokenData['role'];

//         switch (role) {
//           case 'admin':
//             return Admin_Page();
//           case 'student':
//             return HiddenDrawer(token: widget.token);
//           default:
//             return Login();
//         }
//       } catch (e) {
//         print('Error decoding token: $e');
//       }
//     }

//     return Login();
//   }
// }

















