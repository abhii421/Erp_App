// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
// import 'package:http/http.dart' as http;




// class MarkAttendance extends StatefulWidget {
//   const MarkAttendance({super.key});

//   @override
//   State<MarkAttendance> createState() => _MarkAttendanceState();
// }

// class _MarkAttendanceState extends State<MarkAttendance> {
//   final username = TextEditingController();
//   final subject_code = TextEditingController();
//   final date = TextEditingController();
//   final status = TextEditingController();

//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

//   // void _submitForm() {
//   //   if (_formkey.currentState!.validate()) {}
//   // }

//     void _submitForm() async {
//     if (_formkey.currentState!.validate()) {
//       // Prepare the request body
//       Map<String, dynamic> requestBody = {
//         "username": username.text,
//         "subject_code": subject_code.text,
//         "date": date.text,
//         "status": status.text,
//       };


//       // Prepare headers with your token
//       Map<String, String> headers = {
//         'Token':
//             'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoic3R1ZGVudDAxIiwicm9sZSI6InN0dWRlbnQifQ.UkULa-lSkrgCyxlHi106ocV1261_YpI3tFbxRfk09lg'
//       };

//             try {
//         // Make the POST request
//         final response = await http.post(
//           Uri.parse('https://erp.anaskhan.site/api/mark_attendance/'),
//           headers: headers,
//           body: jsonEncode(requestBody),
//         );

//         // Check if the request was successful
//         if (response.statusCode == 200) {
//           print("Attendance marked successfully");
//         } else {
//           print("Failed to mark attendance. ${response.reasonPhrase}");
//         }
//       } catch (error) {
//         print("Error: $error");
//       }
//     }
//   }





//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             children: [
//               Center(
//                 child: Container(
//                   height: 400,
//                   width: 350,
//                   child: Lottie.network(
//                       'https://lottie.host/c242c429-a36c-4b87-8857-8059b7d122cd/hYaQLPOMlL.json'),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Form(
//                   key: _formkey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       // SizedBox(
//                       //   height: 10,
//                       // ),
//                       Text(
//                         "Mark Attendance",
//                         style: GoogleFonts.ubuntu(
//                             textStyle: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold)),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         controller: username,
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.deepPurpleAccent),
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.deepPurpleAccent),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           hintText: 'Username',
//                           labelText: "Username",
//                           labelStyle: TextStyle(
//                             color: Colors.black54,
//                           ),
//                           fillColor: Colors.grey[200],
//                           filled: true,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),

//                       TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         controller: subject_code,
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.deepPurpleAccent),
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.deepPurpleAccent),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           hintText: 'Subject-Code',
//                           labelText: "Subject-Code",
//                           labelStyle: TextStyle(
//                             color: Colors.black54,
//                           ),
//                           fillColor: Colors.grey[200],
//                           filled: true,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),

//                       TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         controller: date,
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.deepPurpleAccent),
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.deepPurpleAccent),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           hintText: 'yyyy-MM-dd',
//                           labelText: "Date",
//                           labelStyle: TextStyle(
//                             color: Colors.black54,
//                           ),
//                           fillColor: Colors.grey[200],
//                           filled: true,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),

//                       TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         controller: status,
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.deepPurpleAccent),
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.deepPurpleAccent),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           hintText: 'Status',
//                           labelText: "Status",
//                           labelStyle: TextStyle(
//                             color: Colors.black54,
//                           ),
//                           fillColor: Colors.grey[200],
//                           filled: true,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),

//                       InkWell(
//                         onTap: () {
//                           if (_formkey.currentState!.validate())
//                           _submitForm();
//                         },
//                         child: Container(
//                           alignment: Alignment.center,
//                           margin: EdgeInsets.only(bottom: 18),
//                           width: 280,
//                           padding: EdgeInsetsDirectional.all(7),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(18),
//                             border: Border.all(color: Colors.black),
//                             gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 // stops: [
//                                 //   0.4,
//                                 //   0.7
//                                 // ],
//                                 colors: <Color>[
//                                   Color.fromARGB(255, 51, 113, 165),
//                                   Color.fromARGB(255, 116, 235, 245),
//                                 ]),
//                           ),
//                           child: Text(
//                             'Mark Attendance',
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class MarkAttendance extends StatefulWidget {
  const MarkAttendance({super.key});

  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  final username = TextEditingController();
  final subject_code = TextEditingController();
  final date = TextEditingController();
  final status = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void _submitForm() async {
    if (_formkey.currentState!.validate()) {
      // Prepare the request body
      Map<String, dynamic> requestBody = {
        "username": username.text,
        "subject_code": subject_code.text,
        "date": date.text,
        "status": status.text,
      };

      // Prepare headers with your token
      Map<String, String> headers = {
        'Token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoxMiwicm9sZSI6ImFkbWluIn0.OLcAyOVGrWlAakotG3k8r_71O98E8reXJlZe59Dbggg'
      };

      try {
        // Make the POST request
        final response = await http.post(
          Uri.parse('https://erp.anaskhan.site/api/mark_attendance/'),
          headers: headers,
          body: requestBody,
        );

        // Check if the request was successful
        if (response.statusCode == 200) {
          print("Attendance marked successfully");
        } else {
          print("Failed to mark attendance. ${response.reasonPhrase}");
        }
      } catch (error) {
        print("Error: $error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 400,
                  width: 350,
                  child: Lottie.network(
                      'https://lottie.host/c242c429-a36c-4b87-8857-8059b7d122cd/hYaQLPOMlL.json'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Mark Attendance",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: username,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Username',
                          labelText: "Username",
                          labelStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: subject_code,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Subject-Code',
                          labelText: "Subject-Code",
                          labelStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: date,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'yyyy-MM-dd',
                          labelText: "Date",
                          labelStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: status,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Status',
                          labelText: "Status",
                          labelStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formkey.currentState!.validate())
                            _submitForm();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 18),
                          width: 280,
                          padding: EdgeInsetsDirectional.all(7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.black),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color.fromARGB(255, 51, 113, 165),
                                Color.fromARGB(255, 116, 235, 245),
                              ],
                            ),
                          ),
                          child: Text(
                            'Mark Attendance',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



