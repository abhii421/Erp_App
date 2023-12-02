// import 'package:flutter/material.dart';

// class MyWidget extends StatefulWidget {

//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer:
//       Drawer(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: <Widget>[
//                 DrawerHeader(
//                   decoration: BoxDecoration(color: Colors.blue),
//                   child: UserAccountsDrawerHeader(
//                     accountName: Text('ffsdfsd'),
//                     accountEmail: Text(' fdff'),
//                     currentAccountPicture: CircleAvatar(
//                       backgroundImage: AssetImage(''),
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   onTap:() {

//                   },
//                   leading: Icon(Icons.person),
//                   title: Text("Account"),
//                   subtitle: Text("Personal"),
//                   trailing: Icon(Icons.edit),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.person),
//                   title: Text("Account"),
//                   subtitle: Text("Personal"),
//                   trailing: Icon(Icons.share),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.person),
//                   title: Text("Account"),
//                   subtitle: Text("Personal"),
//                   trailing: Icon(Icons.shape_line_rounded),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.person),
//                   title: Text("Signout"),
//                   subtitle: Text("Signout from here"),
//                   trailing: Icon(Icons.edit),
//                 ),
//               ],
//             ),
//           ),

//       body: Column(
//         children: [

//           IconButton(
//             onPressed: (){
//             // icon: const Icon(Icons.remove_red_eye_sharp)
//             onPressed: () {

//              Scaffold.of(context).openDrawer();
//              };
//                  tooltip: 'Open Drawer';

//             },
//             icon: Icon(Icons.abc_rounded),
//             ),
//           Container(

//             child: Column(
//               children: [
//                  IconButton(
//             onPressed: (){
//             // icon: const Icon(Icons.remove_red_eye_sharp)
//             onPressed: () {

//              Scaffold.of(context).openDrawer();
//              };
//                  tooltip: 'Open Drawer';

//             },
//             icon: Icon(Icons.abc_rounded),
//             ),
//               ],
//             ),
//             width: MediaQuery.of(context).size.width,
//             height: 170,

//             // decoration: const BoxDecoration(
//             //     gradient: LinearGradient(
//             //   colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],

//             // )),

//             decoration: BoxDecoration(
//                         // color: Colors.grey.shade400,
//                         color: const Color.fromARGB(255, 190, 157, 249),
//                         boxShadow: [
//                           BoxShadow(
//                               blurRadius: 5,
//                               spreadRadius: 5,
//                               color: Color.fromARGB(255, 138, 119, 166))
//                         ],
//                         // borderRadius: const BorderRadius.only(
//                         //     bottomLeft: Radius.circular(80),
//                         //     bottomRight: Radius.circular(80)),
//                             ),

//           )
//         ],
//       ),

//     );
//   }
// }

// import 'dart:js_util';

import 'dart:ui';

import 'package:erp_app2/Events/Event_page.dart';
import 'package:erp_app2/Events/add_post.dart';
import 'package:erp_app2/screen2/Event_page2.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Admin_Page extends StatefulWidget {
  const Admin_Page({Key? key}) : super(key: key);

  @override
  State<Admin_Page> createState() => _Admin_PageState();
}

class _Admin_PageState extends State<Admin_Page> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(
        height: 680,
        child: Drawer(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          shadowColor: const Color.fromARGB(255, 212, 0, 0),
          backgroundColor: const Color.fromARGB(255, 177, 139, 244),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // DrawerHeader(
              //   decoration: BoxDecoration(color: Color.fromARGB(255, 168, 115, 247)),
              //   // child: UserAccountsDrawerHeader(
              //   //   accountName: Text('ffsdfsd'),
              //   //   accountEmail: Text(' fdff'),
              //   //   currentAccountPicture: CircleAvatar(
              //   //     backgroundImage: AssetImage(''),
              //   //   ),
              //   // ),
              //   child: Column(
              //     children: <Widget>[
              //       Text('SmartEDU', style: TextStyle( color: Colors.white, fontSize: 25),),

              //       Divider( color: Colors.white, thickness: 20 , height: 20,),

              //       Text('fdfffff'),
              //     ],
              //   )
              // ),

              SizedBox(
                height: 65,
                child: DrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 177, 139, 244)),

                  //       border: Border(
                  //   bottom: Divider.createBorderSide(context,
                  //       color: Colors.red, width: 2.0),
                  // ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Adjusted
                    children: <Widget>[
                      Text(
                        'SmartEDU',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      // Divider(color: Colors.white, thickness: 2, height: 60,  ),
                      // Text('fdfffff', style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),

              Divider(
                color: Colors.white,
                thickness: 2,
                height: 60,
              ),

              ListTile(
                onTap: () {

                   Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddPostScreen(),
                            ),
                          );

                  
                },
                leading: Icon(
                  Icons.speed_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  "Add Events",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  
                ),
                subtitle: Text(
                  "Personal",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.edit, color: Colors.white),
              ),
              ListTile(
                onTap: () {

                   Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage2(),
                            ),
                          );


                },
                leading: Icon(
                  Icons.batch_prediction_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  "Events",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                subtitle: Text(
                  "College",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.edit, color: Colors.white),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.star_border_sharp,
                  color: Colors.white,
                ),
                title: Text(
                  "Account",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "Personal",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.edit, color: Colors.white),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  "Account",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "Personal",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.edit, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 125,
                      width: 370,
                      child: Card(
                        color: Color.fromARGB(255, 141, 150, 218),
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
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image.asset(
                                  //   'assets/images/icon.png',
                                  //   height: 100,
                                  // ),

                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/B6F8D318-51DD-43B4-8A96-0FAD923E6033.jpeg'),
                                    radius: 40,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Student',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '5000',
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      ),
                                    ],
                                  ),

                                  // Image.asset(
                                  //   'assets/images/6BB89A8D-CEF5-44E6-9785-9349DC7C96FC.jpeg',
                                  //   height: 100,
                                  // ),
                                  SizedBox(
                                    width: 10,
                                  ),

                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/6BB89A8D-CEF5-44E6-9785-9349DC7C96FC.jpeg'),
                                    radius: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),

                                  Column(children: [
                                    Text(
                                      'Teacher',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '2220',
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                  ]),

                                  // Align(
                                  //   alignment: Alignment.bottomRight,
                                  //   child: Text(
                                  //     ' Estimated Cgpa:-',
                                  //     style: TextStyle(
                                  //         fontSize: 18,
                                  //         fontWeight: FontWeight.normal,
                                  //         color: const Color.fromARGB(
                                  //             255, 120, 119, 119)),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 190, 157, 249),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 5,
                      color: Color.fromARGB(255, 138, 119, 166),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                width: 370,
                child: Card(
                  color: Color.fromARGB(255, 141, 150, 218),
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
                        padding: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Column(children: [
                                  Text(
                                    ' Estimated Cgpa:-',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    ' Estimated Cgpa:-',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                ]),
                              ),

                              SizedBox(
                                width: 80,
                              ),

                              Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                      'assets/images/Login screen 2 phone (2).png',
                                      height: 170)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 388,
                    width: 500,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 0),
                                    child: Column(
                                      children: [
                                        Text(
                                          ' Faculty Name',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              ' Monika',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.arrow_drop_down),
                                              iconSize: 32,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                            height: 250,
                                            width: 250,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: TableCalendar(

                                              
                                              shouldFillViewport: true,

                                              

                                              focusedDay:
                                                  _focusedDay, // focus current day
                                              firstDay: DateTime(2023),
                                              lastDay: DateTime(2024),
                                              calendarFormat: _calendarFormat,

                                              onDaySelected:
                                                  (selectedDay, focusedDay) {
                                                if (!isSameDay(_selectedDate,
                                                    selectedDay)) {
                                                  // call setsa. to update selected day

                                                  setState(() {
                                                    _selectedDate = selectedDay;
                                                    _focusedDay = focusedDay;
                                                  });
                                                }
                                              },

                                              selectedDayPredicate: (day) {
                                                return isSameDay(
                                                    _selectedDate, day);
                                              },

                                              onFormatChanged: (format) {
                                                if (_calendarFormat != format) {
                                                  setState(() {
                                                    _calendarFormat = format;
                                                  });
                                                }
                                              },

                                              onPageChanged: (focusedDay) {
                                                _focusedDay = focusedDay;
                                              },
                                            )),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    width: 25,
                                  ),

                                  // Align(
                                  //     alignment: Alignment.topRight,
                                  //     child: Image.asset(
                                  //         'assets/images/Login screen 2 phone (2).png',
                                  //         height: 200)),

                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 80),
                                        child: Container(
                                          height: 30,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: const Color.fromARGB(255, 250, 182, 93)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('8:30 a.m.',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: const Color.fromARGB(255, 250, 182, 93)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('9:20 a.m.',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 82,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: const Color.fromARGB(255, 250, 182, 93)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('11:00 a.m.',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 82,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: const Color.fromARGB(255, 250, 182, 93)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('11:50 a.m.',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: const Color.fromARGB(255, 250, 182, 93)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('1:30 a.m.',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: const Color.fromARGB(255, 250, 182, 93)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('2:20 a.m.',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: const Color.fromARGB(255, 250, 182, 93)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('3:10 a.m.',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10,),


                                    Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 80),
                                        child: Container(
                                           alignment: Alignment.center,
                                          height: 30,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color.fromARGB(255, 255, 255, 255)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('DSA',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(255, 255, 255, 255)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('UHV',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                         alignment: Alignment.center,
                                        height: 30,
                                        width: 82,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(255, 255, 255, 255)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('COA',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                         alignment: Alignment.center,
                                        height: 30,
                                        width: 82,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(255, 255, 255, 255)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Discrete',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                         alignment: Alignment.center,
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(255, 255, 255, 255)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Soft Skill',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                         alignment: Alignment.center,
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(255, 255, 255, 255)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('2:20 a.m.',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                         alignment: Alignment.center,
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(255, 255, 255, 255)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Math-IV',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ],
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 200,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          child: Column(children: [
                                            Text(
                                              ' Estimated Cgpa',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),

                                            // Text(
                                            //   ' Estimated Cgpa',
                                            //   style: TextStyle(
                                            //       fontSize: 20,
                                            //       fontWeight: FontWeight.normal,
                                            //       color: Colors.white),
                                            // ),
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
                          height: 70,
                          width: 200,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          child: Column(children: [
                                            Center(
                                              child: Text(
                                                ' Estimated Cgpa',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
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
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _isSelectedDay(DateTime day) {
    return isSameDay(_selectedDate, day);
  }
}
