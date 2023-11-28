import 'dart:convert';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class markAttendancePage extends StatefulWidget {
  const markAttendancePage({super.key});

  @override
  State<markAttendancePage> createState() => _markAttendancePageState();
}

class _markAttendancePageState extends State<markAttendancePage> {

  List<String> studentList = [];
  //all the students will be in this list (who will be marked absent or present)
  //this list will be fetched via api
   //String username = ;
  bool status = true;

  @override


  void initState(){
    
    super.initState();
    fetchStudentList();
  }

  Future<void> fetchStudentList() async {
    try{
      
    final response = await http.get(Uri.parse('this api will consist of all the students list'));


    if(response.statusCode == 200)
      {

        final List<dynamic> decodedList = jsonDecode(response.body);
        setState(() {
          studentList = List<String>.from(decodedList.map((dynamic item) => item.toString()));
        });
      }

    else {
      print('Error');
    }
    
    }
    catch(error){
      print('Exception : $error');
    }
    
  }



  void changeStatusOnClick(){
    //when called, whatever will be the current status it will change the status to opposite
    if(status == true)
    {
      status = false;
    }

    else if(status == false)
    {
      status = true;
    }
  }

  void getPresenceStatus(){
    String presenceStatus = "A";
  if(status == false)
  {
  presenceStatus = "A";
  }

  else if(status == true)
  {
  presenceStatus = "P";
  }
//print(presenceStatus);
}




  Future<void> markAttendance(String username) async {




    try{
      
      final response1 = await http.post(
          Uri.parse('https://erp.anaskhan.site/api/mark_attendance/'),

          body : {
                  "username" : username,
                  "subject_code" : //drop down menu se ayega subject code
                  "date" : //faculty dashboard me jo calendar hai, us se variable ayega, which will consist of today's date
                  "status" : prese
      //if faculty is willing to change attn of other dates, we will keep a date picker
      //which will again open the student list tiles, where the status can be changed,
      //in that case, the same body will be used with other dates, just the date picker will give us a
      //variable which can be used in "date" key.


      },


      );

      
    }catch(error)
    {
      print('$error');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
          Column(
            children: [
              ListView.builder(itemBuilder: (context,index)
              {
                final username = studentList[index];
               // final studentNumber = studentList[];

                return ListTile(
                  title : Text('$username'),
                  trailing:   LiteRollingSwitch(

                    onTap: (){

                      print('tapped');

                      },

                    onDoubleTap: (){
                      print('double tapped');
                      },

                    onSwipe: (){
                      print('Swipped');
                      },

                    onChanged: (bool status){
                      print('changed');
                      },

                    colorOff:  Color(0x4C7F75C0),
                    iconOff: Icons.not_interested,
                    colorOn: Color(0x9B7F75C1),
                    textOff: 'A',
                    textOn: 'P',
                    textOffColor: Colors.black,
                    width: 100,


                  ),




                  // LiteRollingSwitch(
                  //
                  //     onTap: (){
                  //       currentStatus = "P";
                  //       markAttendance(username);
                  //     },
                  //
                  //
                  //     onDoubleTap: (){},
                  //     onSwipe: onSwipe,
                  //     onChanged: onChanged)

                );
              }

              ),
            ],
          )




    );
  }
}
