// import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Admin Profile',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: AdminProfilePage(),
//     );
//   }
// }

// class AdminProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 80,
//               backgroundImage: AssetImage('assets/admin-image.jpg'), // Replace with the actual path to the admin's image
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Admin Name',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Email: admin@example.com\nRole: Administrator',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Add functionality for the button if needed
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               ),
//               child: Text('Edit Profile'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MyApp3 extends StatefulWidget {
//   @override
//   _MyApp3State createState() => _MyApp3State();
// }

// class _MyApp3State extends State<MyApp3> {
//   Map<String, dynamic> studentData = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     var apiUrl = 'https://erp.anaskhan.site/api/student_profile/';
//     var headers = {
//       'Token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoic3R1ZGVudDAxIiwicm9sZSI6InN0dWRlbnQifQ.UkULa-lSkrgCyxlHi106ocV1261_YpI3tFbxRfk09lg',
//     };

//     try {
//       var response = await http.get(Uri.parse(apiUrl), headers: headers);

//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         setState(() {
//           studentData = data;
//         });
//       } else {
//         print('Failed to load data: ${response.reasonPhrase}');
//       }
//     } catch (error) {
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//        Scaffold(

//         body: Container(

//           child: SingleChildScrollView(
//             child: Center(
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: Text(' ${studentData['fname']}  ${studentData['lname']}',
//                                   style: TextStyle(
//                                      fontSize: 25,
//                                      color: const Color.fromARGB(255, 180, 145, 239),
//                                      fontWeight: FontWeight.bold,
//                                   ),

//                                       ),

//                   ),

//                      GestureDetector(
//                   onTap: (){
//                     showDialog(context: context, builder: (context) {
//                       return Container(
//                         child: CircleAvatar(backgroundImage: NetworkImage(ProfilePhotoUrl!),radius: 50,),
//                       );
//                     },);
//                   },
//                   child: Container(
//                     height: 70,
//                     width: 70,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: Colors.black,
//                       )
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(100),
//                       child: ProfilePhotoUrl!.isNotEmpty
//                        ? Image.network('',
//                         fit: BoxFit.cover,

//                         loadingBuilder: (context, child , loadingProgress){
//                           if(loadingProgress == null) return child ;
//                           return Center(child: CircularProgressIndicator(),);
//                         },
//                         errorBuilder: (context ,Object, Stack){
//                           return Container(
//                             child: Icon(Icons.error_outline, color: Colors.amber,),
//                           );
//                         }
//                                    ): Center(child: CircularProgressIndicator(),)
//                     ),
//                   ),
//                 ),

//                   // Text(' ${studentData['lname']}'),
//                   // Text('Phone: ${studentData['phone']}'),
//                   // Text('Aadhar: ${studentData['aadhar']}'),
//                   // Text('Address: ${studentData['address']}'),
//                   // Text('Semester: ${studentData['semester']}'),
//                   // Text('Branch: ${studentData['branch']}'),
//                   // Text('Section: ${studentData['section']}'),
//                   // Text('Date of Birth: ${studentData['dob']}'),

//                 ],
//               ),
//             ),
//           ),
//         ),

//     );
//   }
// }

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StudentProfileScreen extends StatefulWidget {
  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  late String photoUrl;
  late String fname;
  late String lname;
  late String phone;
  late String aadhar;
  late String address;
  late int semester;
  late String branch;
  late int section;
  late String dob;
  late String? fatherName; 
  late String? fatherPhone;
  late String? fatherEmail;
  late String? motherName;
  late String? motherPhone;
  late String? motherEmail;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var headers = {
        'Token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoic3R1ZGVudDAxIiwicm9sZSI6InN0dWRlbnQifQ.UkULa-lSkrgCyxlHi106ocV1261_YpI3tFbxRfk09lg'
      };

      var request = http.Request(
        'GET',
        Uri.parse('https://erp.anaskhan.site/api/student_profile/'),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var jsonData = jsonDecode(responseBody);

        setState(() {
          photoUrl = jsonData['photo_url'];
          fname = jsonData['fname'];
          lname = jsonData['lname'];
          phone = jsonData['phone'];
          aadhar = jsonData['aadhar'];
          address = jsonData['address'];
          semester = jsonData['semester'];
          branch = jsonData['branch'];
          section = jsonData['section'];
          dob = jsonData['dob'];
          fatherName = jsonData['father_name'];
          fatherPhone = jsonData['father_phone'];
          fatherEmail = jsonData['father_email'];
          motherName = jsonData['mother_name'];
          motherPhone = jsonData['mother_phone'];
          motherEmail = jsonData['mother_email'];

          isLoading = false;
        });
      } else {
        print('Error: ${response.reasonPhrase}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        ' $fname  $lname ',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 175, 139, 238),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                       SizedBox(height: 5),

                      Text(
                        '${fatherEmail ?? 'N/A'} ',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 175, 139, 238),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(photoUrl),
                                  radius: 50,
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color.fromARGB(255, 214, 196, 238), width: 8
                              )),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: photoUrl.isNotEmpty
                                  ? Image.network(photoUrl, fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }, errorBuilder: (context, Object, Stack) {
                                      return Container(
                                        child: Icon(
                                          Icons.error_outline,
                                          color: Colors.amber,
                                        ),
                                      );
                                    })
                                  : Center(
                                      child: CircularProgressIndicator(),
                                    )),
                        ),
                      ),

                               SizedBox(height: 5),

                      Text(
                        ' BTech (1st Year) ',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 175, 139, 238),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),

                               SizedBox(height: 5),

                      Text(
                        ' $branch',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 175, 139, 238),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        alignment: Alignment.center,
                        height: 220,
                        width: 380,
                        child: Card(
                          shadowColor: Colors.white,
                          color: Color.fromARGB(255, 141, 150, 218),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 5,
                                sigmaY: 5,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Align(
                                      //   alignment: Alignment.topLeft,
                                      //   child: Text(
                                      //     ' Estimated Cgpa:-',
                                      //     style: TextStyle(
                                      //         fontSize: 18,
                                      //         fontWeight: FontWeight.normal,
                                      //         color: const Color.fromARGB(
                                      //             255, 120, 119, 119)),
                                      //   ),
                                      // ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, left: 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                          Text(
                                            'Personal Information',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 5,),

                                          Text(
                                            ' Name:- $fname $lname ',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),

                                          // Text(
                                          //   '$fname',
                                          //   style: TextStyle(
                                          //     fontSize: 20,
                                          //     fontWeight: FontWeight.normal,
                                          //     color: Colors.white,
                                          //   ),
                                          // ),

                                          Text(
                                            'Contact No.:- $phone',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),

                                          Text(
                                            'Aadhar:- $aadhar',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),

                                          Text(
                                            'Semester:- $semester',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),

                                                       Text(
                                            'Section:- $section',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),

                                                       Text(
                                            'DOB:- $dob',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        alignment: Alignment.center,
                        height: 230,
                        width: 380,
                        child: Card(
                          shadowColor: Colors.white,
                          color: Color.fromARGB(255, 141, 150, 218),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 5,
                                sigmaY: 5,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Align(
                                      //   alignment: Alignment.topLeft,
                                      //   child: Text(
                                      //     ' Estimated Cgpa:-',
                                      //     style: TextStyle(
                                      //         fontSize: 18,
                                      //         fontWeight: FontWeight.normal,
                                      //         color: const Color.fromARGB(
                                      //             255, 120, 119, 119)),
                                      //   ),
                                      // ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, left: 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          
                                          children: [
                                          Text(
                                            ' Parents Details',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 5,),

                                           Text(
                                            'Father Name:- $fatherName',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),


                                           Text(
                                            'Mother Name:- $motherName',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),


                                           Text(
                                            'Father Email:- $fatherEmail',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),


                                           Text(
                                            'Mother Email:- $motherEmail',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),


                                           Text(
                                            'Father No.:- $fatherPhone',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),

                                              Text(
                                            'Mother No.:- $motherPhone',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),


                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // SizedBox(height: 16),
                      // Text('First Name: $fname'),
                      // Text('Last Name: $lname'),
                      // Text('Phone: $phone'),
                      // Text('Aadhar: $aadhar'),
                      // Text('Address: $address'),
                      // Text('Semester: $semester'),
                      // Text('Branch: $branch'),
                      // Text('Section: $section'),
                      // Text('Date of Birth: $dob'),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
