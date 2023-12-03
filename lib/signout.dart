import 'package:erp_app2/hidden_drawer.dart';
import 'package:erp_app2/screens/Login.dart';
import 'package:erp_app2/screens/settingpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenModel {
  static const String _tokenKey = 'token';

  static Future<void> saveToken(String token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, token);
    } catch (error) {
      print("Error saving token: $error");
    }
  }

  static Future<String?> loadToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(_tokenKey);
    } catch (error) {
      print("Error loading token: $error");
      return null;
    }
  }

  static Future<void> clearToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);
    } catch (error) {
      print("Error clearing token: $error");
    }
  }
}

class New extends StatelessWidget {
  final String token;
  

  const New({required this.token, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (token == null) {
      // You might want to show a loading spinner, an error message, or navigate to the login screen.
      return CircularProgressIndicator();
    } else {
      print('hi..');
      print('$token');
      return Scaffold(
        body: Container(

          decoration: const BoxDecoration(

          image: DecorationImage(
            image: AssetImage("assets/images/Frame (1).png"),
            fit: BoxFit.cover,
          ),
        ),

          child: Padding(
            padding: const EdgeInsets.only(left: 35, bottom: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      await TokenModel.clearToken();
        
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 18),
                      height: 45,
                      width: 280,
                      padding: EdgeInsetsDirectional.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
        
                            colors: <Color>[
                              Color.fromARGB(255, 231, 53, 21),
                              Color.fromARGB(255, 225, 138, 75),
                            ]),
                      ),
                      child: Text(
                        'SignOut',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      // await TokenModel.clearToken();
        
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HiddenDrawer( token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoic3R1ZGVudDAxIiwicm9sZSI6InN0dWRlbnQifQ.UkULa-lSkrgCyxlHi106ocV1261_YpI3tFbxRfk09lg',)),
                      );
        
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 18),
                      height: 45,
                      width: 280,
                      padding: EdgeInsetsDirectional.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // stops: [
                            //   0.4,
                            //   0.7
                            // ],
                            colors: <Color>[
                              Color.fromARGB(255, 53, 151, 3),
                              Color.fromARGB(255, 143, 246, 174),
                            ]),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      );
    }
  }
}





// import 'package:erp_app2/hidden_drawer.dart';
// import 'package:erp_app2/screens/Login.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class TokenModel {
//   static const String _tokenKey = 'token';

//   static Future<void> saveToken(String token) async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString(_tokenKey, token);
//     } catch (error) {
//       print("Error saving token: $error");
//     }
//   }

//   static Future<String?> loadToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       return prefs.getString(_tokenKey);
//     } catch (error) {
//       print("Error loading token: $error");
//       return null;
//     }
//   }

//   static Future<void> clearToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.remove(_tokenKey);
//     } catch (error) {
//       print("Error clearing token: $error");
//     }
//   }
// }

// class New extends StatelessWidget {
//   final String token;

//   const New({required this.token, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (token == null) {
//       // You might want to show a loading spinner, an error message, or navigate to the login screen.
//       return CircularProgressIndicator();
//     } else {
//       print('hi..');
//       print('$token');
//       return Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.only(left: 35, bottom: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               InkWell(
//                 onTap: () async {
//                   await TokenModel.clearToken();

//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => Login()),
//                   );
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.only(bottom: 18),
//                   height: 45,
//                   width: 280,
//                   padding: EdgeInsetsDirectional.all(7),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(18),
//                     border: Border.all(color: Colors.black),
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: <Color>[
//                         Color.fromARGB(255, 231, 53, 21),
//                         Color.fromARGB(255, 225, 138, 75),
//                       ],
//                     ),
//                   ),
//                   child: Text(
//                     'SignOut',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               InkWell(
//                 onTap: () async {
//                   if (token != null) {
//                     print('Token before navigating: $token');
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HiddenDrawer(token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoic3R1ZGVudDAxIiwicm9sZSI6InN0dWRlbnQifQ.UkULa-lSkrgCyxlHi106ocV1261_YpI3tFbxRfk09lg'),
//                       ),
//                     );
//                   } else {
//                     print('Token is null. Unable to navigate to HiddenDrawer.');
//                   }
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.only(bottom: 18),
//                   height: 45,
//                   width: 280,
//                   padding: EdgeInsetsDirectional.all(7),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(18),
//                     border: Border.all(color: Colors.black),
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: <Color>[
//                         Color.fromARGB(255, 53, 151, 3),
//                         Color.fromARGB(255, 143, 246, 174),
//                       ],
//                     ),
//                   ),
//                   child: Text(
//                     'Cancel',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: New(token: 'your_actual_token_value'),
//     ),
//   );
// }

