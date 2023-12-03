import 'package:erp_app2/teachers_dashboard/markAttendancePg.dart';
import  'package:flutter/material.dart';
//import 'package:g/markAttendancePage.dart';
//import 'package:erp_app2/test/token.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;



class FacultyHomePage extends StatefulWidget {
  final facultytoken;
  const FacultyHomePage({Key? key, this.facultytoken}) : super(key: key);

  @override
  State<FacultyHomePage> createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<FacultyHomePage> {

  String facultytoken = "h";
  String? faculty_title;
  String? faculty_firstname;
  String? faculty_firstname1;
  String? faculty_lastname;
  String? faculty_gender;
  String? faculty_phone;
  String? faculty_aadhar;
  String? faculty_address;


  @override

  void initState(){
    super.initState();
    getFacultyHomePage();
  }



  Future <void> getFacultyHomePage() async {
    try {
      //String? facultytoken =  'abc';//await TokenManager.getToken();

      if (facultytoken == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Repeat the Login Process'),
          duration: Duration(seconds: 2),
        )
        );
        //return;
      }

      if(facultytoken!=null){
        print('faculty token isnt null');
      }

      var header = {
        //'Token': facultytoken,
        'Token' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoidGVhY2hlcjAxIiwicm9sZSI6ImZhY3VsdHkifQ.DJTBSU2988OOziUI5bvyuUAFIb4wsrBfMdDzcXbghvs'
      };


      var response1 = await http.get(
        Uri.parse('https://erp.anaskhan.site/api/fetch_staff_details/'),
        headers: header,
      );

      if (response1.statusCode == 200) {
        Map<dynamic, dynamic> jsonDataMap = jsonDecode(response1.body);

        setState(() {
          faculty_title = jsonDataMap['title'];
          faculty_firstname = jsonDataMap['fname'];
          //faculty_firstname1 = faculty_firstname.toUpperCase();
          faculty_lastname = jsonDataMap['lname'];
          faculty_gender = jsonDataMap['gender'];
          faculty_phone = jsonDataMap['phone'];
          faculty_aadhar = jsonDataMap['aadhar'];
          faculty_address = jsonDataMap['address'];
        }
        );

        print('status is 200');
        print(faculty_lastname);

      }

      else {
        print('status is not 200');
      }

    }
    catch(e){
      print('$e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context){
    //Color(0x9B7F75C1)
    return Scaffold(
      appBar: AppBar(title: Text('SmartEDU', style: TextStyle(color : Colors.white),),centerTitle: true, backgroundColor: Color(0xFF7F75C0),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width : 500,
                height : 90,
                decoration: BoxDecoration(
                    color: Color(0xFF7F75C0)
                ),
              ),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left : 25),
                        child: Text('Hello, $faculty_firstname', style : TextStyle(color: Colors.white, fontSize: 30)
                        ),

                      ),
                      //SizedBox(height : 1),
                      Padding(
                        padding: const EdgeInsets.only(left : 25),
                        child: Text('$faculty_gender', style : TextStyle(
                            color: Colors.white.withOpacity(0.8)
                        )
                        ),
                      )

                    ],
                  ),

                  SizedBox(width : 50),

                  CircleAvatar(radius : 30),
                ],
              )
            ],
          ),
          Container(height:10,
            width : 500,
            decoration: BoxDecoration(color : Color(0xFFA4A2D1)),
          ),

          SizedBox(height : 20),

          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left :12.0),
                child: Container(
                  height : 200,
                  width : 335,
                  decoration: BoxDecoration(color: Color(0xFFA4A2D1),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),

              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left : 30.0, top: 15),
                    child: Column(
                      children: [
                        Text('$faculty_firstname $faculty_lastname',style : TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text('M.Tech., IIT DELHI', style : TextStyle(color: Colors.white)),
                        SizedBox(height: 5,),
                        Text('(Assistant Professor)', style : TextStyle(color: Colors.white)),

                        SizedBox(height : 20),
                        Text('STUDENT RATING',style : TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height : 10),
                        Text('Not to be Shown',  style : TextStyle(color: Colors.white))
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left : 20.0, top: 20),
                    child: Container(
                      height: 150,
                      width : 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  )


                ],
              )

            ],


          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left : 0),
            child: Container(
              height: 170,
              width: 335,
              decoration: BoxDecoration(color: Color(0xFFA4A2D1),
                  borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),

          SizedBox(height : 20),
          Row(
            children: [
              SizedBox(width: 20),
              Container(
                height : 130,
                width : 100,
                decoration: BoxDecoration(color : Color(0xFFA4A2D1)),
                child: Column(
                  children: [
                    Text('SUBJECTS'),
                    SizedBox(height : 10),
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );

  }
}


// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//
//     body:
//
//     Column(
//       children: [
//
//         Drawer(
//           backgroundColor: Color(0xFF1E617B),
//           child: Column(
//             children: [
//               InkWell(child: Text('Attendance'),
//                 onTap: (){
//
//                   Navigator.push(context, MaterialPageRoute(
//                       builder: (context) => markAttendancePage())
//                   );
//
//
//                 },
//               ),
//               InkWell(child: Text('Assignment Submission'),
//                 onTap: (){},
//               ),
//               InkWell(
//                 child: Text('Assignment Grading'),
//                 onTap: (){},
//               ),
//
//             ],
//           ),
//         ),
//
//
//
//       ],
//     ),
//
//
//   );
// }




















































// import 'package:erp_app2/teachers_dashboard/markAttendancePg.dart';
// import  'package:flutter/material.dart';
// import 'package:erp_app2/test/token.dart';
// import 'dart:convert';
// import 'dart:ui';
// import 'package:http/http.dart' as http;
//
//
//
// class FacultyHomePage extends StatefulWidget {
//   final facultytoken;
//   const FacultyHomePage({Key? key, this.facultytoken}) : super(key: key);
//
//   @override
//   State<FacultyHomePage> createState() => _FacultyHomePageState();
// }
//
// class _FacultyHomePageState extends State<FacultyHomePage> {
//
//   String facultytoken = "";
//   String? faculty_title;
//   String? faculty_firstname;
//   String? faculty_lastname;
//   String? faculty_gender;
//   int? faculty_phone;
//   int? faculty_aadhar;
//   String? faculty_address;
//
//
//   @override
//
//   void initState(){
//     super.initState();
//     getFacultyHomePage();
//   }
//
//
//
//   Future <void> getFacultyHomePage() async {
//     try {
//       String? facultytoken = await TokenManager.getToken();
//
//       if (facultytoken == null) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Repeat the Login Process'),
//           duration: Duration(seconds: 2),
//         )
//         );
//         return;
//       }
//
//       var header = {
//         //'Token': facultytoken,
//         'Token' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoidGVhY2hlcjAxIiwicm9sZSI6ImZhY3VsdHkifQ.DJTBSU2988OOziUI5bvyuUAFIb4wsrBfMdDzcXbghvs'
//       };
//
//
//       var response1 = await http.get(
//         Uri.parse('https://erp.anaskhan.site/api/fetch_staff_details/'),
//         headers: header,
//       );
//
//       if (response1.statusCode == 200) {
//         Map<dynamic, dynamic> jsonDataMap = jsonDecode(response1.body);
//
//         setState(() {
//           faculty_title = jsonDataMap['title'];
//           faculty_firstname = jsonDataMap['fname'];
//           faculty_lastname = jsonDataMap['lname'];
//           faculty_gender = jsonDataMap['gender'];
//           faculty_phone = jsonDataMap['phone'];
//           faculty_aadhar = jsonDataMap['aadhar'];
//           faculty_address = jsonDataMap['address'];
//         });
//
//       }
//     }
//     catch(e){
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
//     }
//   }
//
// @override
//       Widget build(BuildContext context){
//
//         return Scaffold(
//         appBar: AppBar(title: Text('SmartEDU'),foregroundColor: Color(0x9B7F75C1),),
//
//
//           body: Column(
//
//
//
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     width : 500,
//                     height : 120,
//                     decoration: BoxDecoration(
//                         color: Color(0xFF7F75C0)
//                     ),
//                   ),
//
//                   Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left : 15),
//                             child: Text('Hello, $faculty_firstname', style : TextStyle(color: Colors.white, fontSize: 30)
//                             ),
//
//
//                           ),
//                           //SizedBox(height : 1),
//                           Text('DSAfaculty_024@akgec.ac.in', style : TextStyle(
//                               color: Colors.white.withOpacity(0.8)
//                           )
//                           )
//                           //DUMMY EMAIL
//                         ],
//                       ),
//
//                       SizedBox(width : 50),
//
//                       CircleAvatar(radius: 35)
//                     ],
//
//                   )
//                 ],
//               ),
//
//               SizedBox(height : 30),
//
//               Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left :12.0),
//                     child: Container(
//                       height : 219,
//                       width : 335,
//                       decoration: BoxDecoration(
//                           color: Color(0xFFA4A2D1),
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                     ),
//                   ),
//
//                   Row(
//                     children: [
//
//                       Padding(
//                         padding: const EdgeInsets.only(left : 30.0, top: 1),
//                         child: Column(
//                           children: [
//                             Text('$faculty_title $faculty_firstname $faculty_lastname',style : TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                             Text('M.Tech., IIT DELHI', style : TextStyle(color: Colors.white)),
//                             SizedBox(height: 5,),
//                             Text('(Assistant Professor)', style : TextStyle(color: Colors.white)),
//
//                             SizedBox(height : 20),
//                             Text('STUDENT RATING',style : TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                             SizedBox(height : 10),
//                             Text('Not to be Shown',  style : TextStyle(color: Colors.white))
//
//                           ],
//                         ),
//                       ),
//
//                       Padding(
//                         padding: const EdgeInsets.only(left : 20.0, top: 20),
//                         child: Container(
//                           height: 170,
//                           width : 120,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15)
//                           ),
//                         ),
//                       )
//
//
//                     ],
//                   )
//
//                 ],
//
//
//               )
//
//
//             ],
//           ),
//         );
//
// }
//     }
//
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //
//   //     body:
//   //
//   //     Column(
//   //       children: [
//   //
//   //         Drawer(
//   //           backgroundColor: Color(0xFF1E617B),
//   //           child: Column(
//   //             children: [
//   //                     InkWell(child: Text('Attendance'),
//   //                       onTap: (){
//   //
//   //                       Navigator.push(context, MaterialPageRoute(
//   //                           builder: (context) => markAttendancePage())
//   //                       );
//   //
//   //
//   //                       },
//   //                     ),
//   //               InkWell(child: Text('Assignment Submission'),
//   //               onTap: (){},
//   //               ),
//   //               InkWell(
//   //                 child: Text('Assignment Grading'),
//   //               onTap: (){},
//   //               ),
//   //
//   //             ],
//   //           ),
//   //         ),
//   //
//   //
//   //
//   //       ],
//   //     ),
//   //
//   //
//   //   );
//   // }
//




