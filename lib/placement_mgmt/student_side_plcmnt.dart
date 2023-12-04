import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentSidePlacement extends StatefulWidget {
  const StudentSidePlacement({super.key});

  @override
  State<StudentSidePlacement> createState() => _StudentSidePlacementState();
}

class _StudentSidePlacementState extends State<StudentSidePlacement> {
  String? placed_or_not;
  String? encouragement_prize_to_be_given;
  String? placement_mode;
  String? Company_name;
  String? Package;

  @override

  void initState(){
    super.initState();
    getStudentPlacementDetails();
  }

  Future<void> getStudentPlacementDetails() async {

    try{

      var header = {
        'Token' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoic3R1ZGVudDAxIiwicm9sZSI6InN0dWRlbnQifQ.UkULa-lSkrgCyxlHi106ocV1261_YpI3tFbxRfk09lg'
      };

      var response = await http.get(Uri.parse('https://erp.anaskhan.site/api/placement/'),
      headers : header
      );



      if(response.statusCode == 200){

        Map<dynamic, dynamic> jsonStudentDataMap = jsonDecode(response.body);

        setState(() {
          placed_or_not = jsonStudentDataMap['placed_or_not'];
          encouragement_prize_to_be_given = jsonStudentDataMap['encouragement_prize_to_be_given'];
          placement_mode = jsonStudentDataMap['placement_mode'];
          Company_name = jsonStudentDataMap['Company_name'];
          Package = jsonStudentDataMap['Package'];
        });

      }

    }catch (e){
      print('$e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString())));
    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
            body :    Padding(
              padding: const EdgeInsets.only(left : 15.0),
              child: Column(
                    children: [
                      SizedBox(height: 60),
                      Text('Placed : $placed_or_not'),
                      SizedBox(height : 30),
                      Text('Encouragement Prize to be Given :  $encouragement_prize_to_be_given'),
                      SizedBox(height : 30),
                      Text('Placement Mode : $placement_mode'),
                      SizedBox(height : 30),
                      Text('Company Name : $Company_name'),
                      SizedBox(height : 30),
                      Text('Package : $Package'),
                    ],
                  ),
            )
    );
  }
}
