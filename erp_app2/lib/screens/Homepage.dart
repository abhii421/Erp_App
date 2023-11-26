import 'dart:convert';
import 'dart:ui';

import 'package:erp_app2/screens/Containers.dart';
import 'package:erp_app2/screens/additional.dart';
import 'package:erp_app2/subject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? selectedSubject;
  String? selected1;
  int? selected1TotalPresent;
  int? selected1TotalAbsent;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      var headers = {
        'Token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoic3R1ZGVudDAxIiwicm9sZSI6InN0dWRlbnQifQ.UkULa-lSkrgCyxlHi106ocV1261_YpI3tFbxRfk09lg', // Replace with your actual token
      };

      var response = await http.get(
        Uri.parse('http://3.109.124.174:1313/api/show_attendance_report/'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List<dynamic>;

        // Assuming you want the subject at index 0 (you can change this as needed)
        var firstSubject =
            jsonData.isNotEmpty ? jsonData[0]['subject'] as String? : null;
        var secondSubject =
            jsonData.isNotEmpty ? jsonData[1]['subject'] as String? : null;
        var secondSubjectTotalPresent =
            jsonData.isNotEmpty ? jsonData[1]['total_present'] as int? : null;
        var secondSubjectTotalAbsent =
            jsonData.isNotEmpty ? jsonData[1]['total_absent'] as int? : null;

        if (secondSubject != null) {
          setState(() {
            selected1 = secondSubject;
            selected1TotalPresent = secondSubjectTotalPresent;
            selected1TotalAbsent = secondSubjectTotalAbsent;
          });

          print('Selected Subject: $selected1');
          print('Selected1 Total Present: $selected1TotalPresent');
          print('Selected1 Total Absent: $selected1TotalAbsent');
        }

        if (firstSubject != null) {
          setState(() {
            selectedSubject = firstSubject;
          });

          // Print the selected subject
          print('Selected Subject: $selectedSubject');
        } else {
          print('No subjects found in the response.');
        }
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: const Color.fromARGB(255, 56, 159, 243),
                        blurRadius: 20.0,
                        offset: Offset(10, 7),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Your Attendance',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    '81%',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
              Text(
                'Your Statistics',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AdditionalInfo(
                        image: Image.asset('assets/images/school_7214224.png'),
                        label: 'Course',
                        value: 'B.Tech(1 Year)',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      AdditionalInfo(
                        image: Image.asset(
                            'assets/images/presentation_760138.png'),
                        label: 'Course',
                        value: 'B.Tech(1 Year)',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      AdditionalInfo(
                        image: Image.asset('assets/images/cv_3194447.png'),
                        label: 'Course',
                        value: 'B.Tech(1 Year)',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'All Subjects',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubjectScreen(
                          subject: selectedSubject ?? '',
                          totalPresent:
                              selected1TotalPresent, // Replace with actual values
                          totalAbsent: selected1TotalAbsent,
                          // subject: subject,
                          // totalPresent: totalPresent,
                          // totalAbsent: totalAbsent,
                        ),
                      ),
                    );
                  },
                  child: ContainerPage(
                      Subject: '$selectedSubject', Attendance: ' Attendance')),
              SizedBox(
                height: 10,
              ),
              ContainerPage(Subject: '$selected1', Attendance: ' Attendance'),
            ],
          ),
        ),
      ),
    );
  }
}
