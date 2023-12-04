import 'dart:convert';
import 'package:erp_app2/test/token.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class markAttendancePage extends StatefulWidget {
  const markAttendancePage({super.key});

  @override
  State<markAttendancePage> createState() => _markAttendancePageState();
}

class _markAttendancePageState extends State<markAttendancePage> {
TextEditingController dateController = TextEditingController();
TextEditingController SubjectController = TextEditingController();

 // List<String> studentUsernameList = ["student01"];
  //all the students will be in this list (who will be marked absent or present)
  //this list will be fetched via api
   //String username = "student01";
  bool status = true;

  @override


  void initState(){
    super.initState();

    //fetchStudentList();
  }

  // Future<void> fetchStudentList() async {
  //   try{
  //
  //   final response = await http.get(Uri.parse('this api will consist of all the students list'));
  //
  //
  //   if(response.statusCode == 200)
  //     {
  //
  //       final List<dynamic> decodedList = jsonDecode(response.body);
  //       setState(() {
  //         studentList = List<String>.from(decodedList.map((dynamic item) => item.toString()));
  //       });
  //     }
  //
  //   else {
  //     print('Error');
  //   }
  //
  //   }
  //   catch(error){
  //     print('Exception : $error');
  //   }
  //
  // }



  void changeStatusOnClick(){
    //when called, whatever will be the current status it will change the status to opposite
    if(status == true)
    {
      setState(() {
        status = false;
      });
      getPresenceStatus();
      print(status);
    }

    else if(status == false)
    {
      setState(() {
        status = true;
      });
      getPresenceStatus();
      print(status);
    }

  }





  String getPresenceStatus()
{
    String presenceStatus = "A";

  if(status == false)
  {
  setState(() {
    presenceStatus = "A";
  });

  print(presenceStatus);
  return presenceStatus;
  }

  else if(status == true)
  {
    setState(() {
      presenceStatus = "P";
    });

    print(presenceStatus);
    return presenceStatus;
  }
  print(presenceStatus);
  markAttendance();
    return presenceStatus;
}




  Future<void> markAttendance() async {

    try{
      dynamic facultytoken = TokenManager.getToken();
      Map <String, String> header = {
        'Token': facultytoken,
        //'Token' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoidGVhY2hlcjAxIiwicm9sZSI6ImZhY3VsdHkifQ.DJTBSU2988OOziUI5bvyuUAFIb4wsrBfMdDzcXbghvs'
      };
      getPresenceStatus();
      final response1 = await http.post(
          Uri.parse('https://erp.anaskhan.site/api/mark_attendance/'),
              headers : header,
          body : {
                  "username" : "student01",
                  "subject_code" : "BCS-305",//drop down menu se ayega subject code
                  "date" : "2023-11-25" ,//faculty dashboard me jo calendar hai, us se variable ayega, which will consist of today's date
                  "status" : getPresenceStatus()
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
              ListView.builder(
                  itemBuilder: (context,index)
              {
                ;
               // final studentNumber = studentList[];

                return ListTile(
                  title : Text('student01'),
                  trailing:   LiteRollingSwitch(

                    onTap: (){
                      print('tapped');
                      changeStatusOnClick();
                      },

                    onDoubleTap: (){},

                    onSwipe: (){
                      print('Swipped');
                      changeStatusOnClick();
                      },

                    onChanged: (bool status){
                      print('changed');
                      changeStatusOnClick();
                      },

                    colorOff:  Color(0x4C7F75C0),
                    iconOff: Icons.not_interested,
                    colorOn: Color(0x9B7F75C1),
                    textOff: 'A',
                    textOn: 'P',
                    textOffColor: Colors.black,
                    width: 100,


                  ),

                );
              }

              ),
            ],
          )




    );
  }
}
