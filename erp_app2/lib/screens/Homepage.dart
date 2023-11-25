import 'dart:ui';

import 'package:erp_app2/screens/Containers.dart';
import 'package:erp_app2/screens/additional.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key ? key}): super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                      color: const Color.fromARGB(255, 56, 159, 243),
                      blurRadius: 20.0,
                      offset: Offset(10, 7)),
                ],
              ),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
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
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                    ),
            ),
      
            SizedBox(height: 10,),
      
            Text('Your Statistics',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
      
            ),),
      
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
                      SizedBox(width: 20,),
              
                      AdditionalInfo(
                      image: Image.asset('assets/images/presentation_760138.png'), 
                      label: 'Course',
                      value: 'B.Tech(1 Year)',
                      ),
                      SizedBox(width: 20,),
      
                      AdditionalInfo(
                        
                      image: Image.asset('assets/images/cv_3194447.png'), 
                      label: 'Course',
                      value: 'B.Tech(1 Year)',
                      ),
                      
      
                   ],
                  
                ),
              ),
            ),
            SizedBox(height: 20,),
      
                      Text('All Subjects',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
      
                      ),),
                      SizedBox(height: 10,),
      
                      ContainerPage(
                        Subject:'Maths',
                         Attendance: ' Attendance'
                         ),

                         SizedBox(height: 10,),
      
                      ContainerPage(
                        Subject:'Maths',
                         Attendance: ' Attendance'
                         ),
                         SizedBox(height: 10,),
      
                      ContainerPage(
                        Subject:'Maths',
                         Attendance: ' Attendance'
                         ),


          ],
        ),
      ),
    );
  }
}
