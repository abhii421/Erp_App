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

import 'package:flutter/material.dart';

class Admin_Page extends StatefulWidget {
  const Admin_Page({Key? key}) : super(key: key);

  @override
  State<Admin_Page> createState() => _Admin_PageState();
}

class _Admin_PageState extends State<Admin_Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                onTap: () {},
                leading: Icon(
                  Icons.speed_rounded,
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
                  Icons.batch_prediction_rounded,
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
                        icon: Icon(
                          Icons.menu_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
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
                                  Image.asset(
                                    'assets/images/icon.png',
                                    height: 100,
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

                                  Image.asset(
                                    'assets/images/icon.png',
                                    height: 100,
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
              Container(
                alignment: Alignment.center,
                height: 270,
                width: 360,
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
                                width: 60,
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
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, bottom: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 100,
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
                                              top: 15, left: 0),
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
                        Container(
                          alignment: Alignment.center,
                          height: 100,
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
                                              top: 15, left: 5),
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
