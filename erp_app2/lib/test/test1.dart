// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class Test extends StatefulWidget {
// //   const Test({Key? key}) : super(key: key);

// //   @override
// //   State<Test> createState() => _TestState();
// // }

// // class _TestState extends State<Test> {
// //   List<String> subjectNames = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     getData();
// //   }

// //   Future<void> getData() async {
// //     try {
// //       var headers = {
// //         'Token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoic3R1ZGVudDAxIiwicm9sZSI6InN0dWRlbnQifQ.UkULa-lSkrgCyxlHi106ocV1261_YpI3tFbxRfk09lg', // Replace with your actual token
// //       };

// //       var response = await http.get(
// //         Uri.parse('http://3.109.124.174:1313/api/show_attendance_report/'),
// //         headers: headers,
// //       );

// //       if (response.statusCode == 200) {
// //         var jsonData = jsonDecode(response.body) as List<dynamic>;

// //         // Clear existing data before adding new data
// //         subjectNames.clear();

// //         for (var jsonSubject in jsonData) {
// //           var subject = jsonSubject['subject'[0]] as String?;
// //           if (subject != null) {
// //             subjectNames.add(subject);
// //           }
// //         }

// //         // Print the subject names
// //         subjectNames.forEach((subject) {
// //           print('Subject: $subject');
// //         });

// //         // Ensure to call setState to trigger a rebuild
// //         setState(() {});
// //       } else {
// //         print('Failed to load data. Status code: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       print('Error fetching data: $e');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // Your UI code using subjectNames
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Subject Names'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: subjectNames.length,
// //         itemBuilder: (context, index) {
// //           var subject = subjectNames[index];
// //           return ListTile(
// //             title: Text(subject),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   String? selectedSubject;

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   Future<void> getData() async {
//     try {
//       var headers = {
//         'Token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoic3R1ZGVudDAxIiwicm9sZSI6InN0dWRlbnQifQ.UkULa-lSkrgCyxlHi106ocV1261_YpI3tFbxRfk09lg', // Replace with your actual token
//       };

//       var response = await http.get(
//         Uri.parse('http://3.109.124.174:1313/api/show_attendance_report/'),
//         headers: headers,
//       );

//       if (response.statusCode == 200) {
//         var jsonData = jsonDecode(response.body) as List<dynamic>;

//         // Assuming you want the subject at index 0 (you can change this as needed)
//         var firstSubject = jsonData.isNotEmpty ? jsonData[0]['subject'] as String? : null;

//         if (firstSubject != null) {
//           setState(() {
//             selectedSubject = firstSubject;
//           });

//           // Print the selected subject
//           print('Selected Subject: $selectedSubject');
//         } else {
//           print('No subjects found in the response.');
//         }
//       } else {
//         print('Failed to load data. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Your UI code using selectedSubject
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Selected Subject'),
//       ),
//       body: Center(
//         child: Text(selectedSubject ?? 'No subject selected'),
//       ),
//     );
//   }
// }

