import 'dart:convert';
import 'dart:ui';

import 'package:erp_app2/screens/Containers.dart';
import 'package:erp_app2/screens/additional.dart';
import 'package:erp_app2/screens/token.dart';
import 'package:erp_app2/subject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  final token;
  const Homepage({Key? key, this.token}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? Name;
  String? Email;
  String? selectedSubject;
  int? selectedSubjectTotalPresent;
  int? selectedSubjectTotalAbsent;

  String? selected1;
  int? selected1TotalPresent;
  int? selected1TotalAbsent;
  String? selected2;
  int? selected2TotalPresent;
  int? selected2TotalAbsent;
  String? selected3;
  int? selected3TotalPresent;
  int? selected3TotalAbsent;
  String? selected4;
  int? selected4TotalPresent;
  int? selected4TotalAbsent;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      String? token = await TokenManager.getToken();

      if (token == null) {
        // Handle case where token is not available
        print('Token is null. User might not be logged in.');
        return;
      }
      var headers = {
        'Token': token,
        //
      };
      print('hi.........');
      print(token);

      var response = await http.get(
        Uri.parse('http://3.109.124.174:1313/api/show_attendance_report/'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List<dynamic>;

        // Assuming you want the subject at index 0 (you can change this as needed)

        // var estimatedCgpa = jsonData.isNotEmpty
        //     ? jsonData.last['Estimated CGPA'] as double?
        //     : null;
        // var overallPercentage = jsonData.isNotEmpty
        //     ? jsonData.last['overall_percentage'] as double?
        //     : null;
        var estimatedCgpa = jsonData.isNotEmpty
            ? (jsonData.last['Estimated CGPA'] as num?)?.toDouble()
            : null;
        var overallPercentage = jsonData.isNotEmpty
            ? jsonData.last['overall_percentage'] as num?
            : null;

        print("estimated CGPA: $estimatedCgpa");
        print("overall Percentage: $overallPercentage");

        var firstName =
            jsonData.isNotEmpty ? jsonData.last['First Name'] as String? : null;
        var email =
            jsonData.isNotEmpty ? jsonData.last['Email'] as String? : null;
        var totalSubjects =
            jsonData.isNotEmpty ? jsonData.last['Toal Subjects'] as int? : null;

        // Printing the result
        print("First Name: $firstName");
        print("Email: $email");
        print("subjects: $totalSubjects");

        var firstSubject =
            jsonData.isNotEmpty ? jsonData[0]['subject'] as String? : null;

        var firstSubjectTotalPresent =
            jsonData.isNotEmpty ? jsonData[0]['total_present'] as int? : null;
        var firstSubjectTotalAbsent =
            jsonData.isNotEmpty ? jsonData[0]['total_absent'] as int? : null;

        var secondSubject =
            jsonData.isNotEmpty ? jsonData[1]['subject'] as String? : null;
        var secondSubjectTotalPresent =
            jsonData.isNotEmpty ? jsonData[1]['total_present'] as int? : null;
        var secondSubjectTotalAbsent =
            jsonData.isNotEmpty ? jsonData[1]['total_absent'] as int? : null;

        var thirdSubject =
            jsonData.isNotEmpty ? jsonData[2]['subject'] as String? : null;
        var thirdSubjectTotalPresent =
            jsonData.isNotEmpty ? jsonData[2]['total_present'] as int? : null;
        var thirdSubjectTotalAbsent =
            jsonData.isNotEmpty ? jsonData[2]['total_absent'] as int? : null;

        var forthSubject =
            jsonData.isNotEmpty ? jsonData[3]['subject'] as String? : null;
        var forthSubjectTotalPresent =
            jsonData.isNotEmpty ? jsonData[3]['total_present'] as int? : null;
        var forthSubjectTotalAbsent =
            jsonData.isNotEmpty ? jsonData[3]['total_absent'] as int? : null;

        var fifthSubject =
            jsonData.isNotEmpty ? jsonData[4]['subject'] as String? : null;
        var fifthSubjectTotalPresent =
            jsonData.isNotEmpty ? jsonData[4]['total_present'] as int? : null;
        var fifthSubjectTotalAbsent =
            jsonData.isNotEmpty ? jsonData[4]['total_absent'] as int? : null;

        if (firstName != null) {
          setState(() {
            Name = firstName;
            Email = email;
          });

          if (secondSubject != null) {
            setState(() {
              selected1 = secondSubject;
              selected1TotalPresent = secondSubjectTotalPresent;
              selected1TotalAbsent = secondSubjectTotalAbsent;
            });
          }

          print('Selected Subject: $selected1');
          print('Selected1 Total Present: $selected1TotalPresent');
          print('Selected1 Total Absent: $selected1TotalAbsent');
        }

        if (secondSubject != null) {
          setState(() {
            selected2 = thirdSubject;
            selected2TotalPresent = thirdSubjectTotalPresent;
            selected2TotalAbsent = thirdSubjectTotalAbsent;
          });
        }

        if (secondSubject != null) {
          setState(() {
            selected3 = forthSubject;
            selected3TotalPresent = forthSubjectTotalPresent;
            selected3TotalAbsent = forthSubjectTotalAbsent;
          });
        }

        if (secondSubject != null) {
          setState(() {
            selected4 = fifthSubject;
            selected4TotalPresent = fifthSubjectTotalPresent;
            selected4TotalAbsent = fifthSubjectTotalAbsent;
          });
        }

        if (firstSubject != null) {
          setState(() {
            selectedSubject = firstSubject;
            selectedSubjectTotalPresent = firstSubjectTotalPresent;
            selectedSubjectTotalAbsent = firstSubjectTotalAbsent;
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
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello $Name',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      '$Email',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
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
                              selectedSubjectTotalPresent, // Replace with actual values
                          totalAbsent: selectedSubjectTotalAbsent,
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubjectScreen(
                        subject: selected1 ?? '',
                        totalPresent:
                            selected1TotalPresent, // Replace with actual values
                        totalAbsent: selected1TotalAbsent,
                      ),
                    ),
                  );
                },
                child: ContainerPage(
                    Subject: '$selected1', Attendance: ' Attendance'),
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
                        subject: selected2 ?? '',
                        totalPresent:
                            selected2TotalPresent, // Replace with actual values
                        totalAbsent: selected2TotalAbsent,
                      ),
                    ),
                  );
                },
                child: ContainerPage(
                    Subject: '$selected2', Attendance: ' Attendance'),
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
                        subject: selected3 ?? '',
                        totalPresent:
                            selected3TotalPresent, // Replace with actual values
                        totalAbsent: selected3TotalAbsent,
                      ),
                    ),
                  );
                },
                child: ContainerPage(
                    Subject: '$selected3', Attendance: ' Attendance'),
              ),
              //   SizedBox(
              //   height: 10,
              // ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubjectScreen(
                          subject: selected4 ?? '',
                          totalPresent:
                              selected4TotalPresent, // Replace with actual values
                          totalAbsent: selected4TotalAbsent,
                        ),
                      ),
                    );
                  },
                  child: ContainerPage(
                      Subject: '$selected4', Attendance: ' Attendance'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
