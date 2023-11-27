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
  print(prefs.getString('token'));
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







// import 'package:erp_app2/subject.dart';
// import 'package:flutter/material.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Homepage(),
//     );
//   }
// }

// class Homepage extends StatelessWidget {
//   // Your JSON data
//   final List<Map<String, dynamic>> jsonData = [
//     {"subject": "DSA", "total_present": 6, "total_absent": 3},
//     {"subject": "COA", "total_present": 6, "total_absent": 3},
//     {"subject": "Discrete Mathematics", "total_present": 6, "total_absent": 4},
//     {"subject": "Cyber Security", "total_present": 6, "total_absent": 2},
//     {"subject": "Maths-IV", "total_present": 6, "total_absent": 2},
//     {"total_present": 30},
//     {"total_absent": 14},
//     {"overall_percentage": 68.18},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Subjects'),
//       ),
//       body: ListView.builder(
//         itemCount: jsonData.length,
//         itemBuilder: (context, index) {
//           final subject = jsonData[index]['subject'];
//           final totalPresent = jsonData[index]['total_present'];
//           final totalAbsent = jsonData[index]['total_absent'];

//           return ListTile(
//             title: Text(subject ?? 'Unknown Subject'),
//             onTap: () {
//               if (subject != null && totalPresent != null && totalAbsent != null) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SubjectScreen(
//                       subject: subject,
//                       totalPresent: totalPresent,
//                       totalAbsent: totalAbsent,
//                     ),
//                   ),
//                 );
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }






