import  'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;



class FacultyHomePage extends StatefulWidget {
  final facultytoken;
  const FacultyHomePage({Key? key, this.facultytoken}) : super(key: key);
      //({super.key});

  @override
  State<FacultyHomePage> createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<FacultyHomePage> {

  String? facultytoken = "";

  @override

  void initState(){
    super.initState();
    getFacultyHomePage();
  }



  Future <void> getFacultyHomePage() async{

    try{

     String? facultytoken = await TokenManager.getToken();

      if(facultytoken == null){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Repeat the Login Process'),
            duration: Duration(seconds: 2),
        )
        );

        return;
      }

      var headers = {
        'Token' : facultytoken,
      };


      var response1 = await http.get(
        Uri.parse('this api will contain teachers details'),
        headers : headers,
      );

      if(response1.statusCode == 200){

        var jsonData = jsonDecode(response1.body) as List<dynamic>;




      }


@override
      Widget build(BuildContext context){

        return Scaffold(
        appBar: AppBar(title: Text('SmartEDU'),foregroundColor: Color(0x9B7F75C1),
),


          body: Column(



            children: [
              Stack(
                children: [
                  Container(
                    width : 500,
                    height : 120,
                    decoration: BoxDecoration(

                        color: Color(0xFF7F75C0)






                    ),
                  ),

                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left : 15),
                            child: Text('Hello, Monika!', style : TextStyle(color: Colors.white, fontSize: 30)
                            ),
                            //DUMMY NAME, ACTUAL TO BE FETCHED BY API

                          ),
                          //SizedBox(height : 1),
                          Text('monika0987@gmail.com', style : TextStyle(
                              color: Colors.white.withOpacity(0.8)
                          )
                          )
                          //DUMMY EMAIL
                        ],
                      ),

                      SizedBox(width : 50),

                      CircleAvatar(radius: 30,)
                    ],


                  )
                ],
              ),

              SizedBox(height : 30),

              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left :12.0),
                    child: Container(
                      height : 219,
                      width : 335,
                      decoration: BoxDecoration(color: Color(0xFFA4A2D1),
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),

                  Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left : 30.0, top: 1),
                        child: Column(
                          children: [
                            Text('MONIKA AGGARWAL',style : TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                          height: 170,
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


              )


            ],
          )








          ),




        );






}





















    }catch(error){
      print('$error');
    }


  }
























  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:

      Column(
        children: [

          Drawer(
            backgroundColor: Color(0xFF1E617B),
            child: Column(
              children: [
                      InkWell(child: Text('Attendance'),
                        onTap: (){
                        
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MarkAttendancePg())
                        );
                        
                        
                        },
                      ),
                InkWell(child: Text('Assignment Submission'),
                onTap: (){},
                ),
                InkWell(
                  child: Text('Assignment Grading'),
                onTap: (){},
                ),

              ],
            ),
          ),



        ],
      ),


    );
  }
}
