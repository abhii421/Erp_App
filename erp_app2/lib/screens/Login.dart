import 'dart:convert';
import 'dart:ffi';
import 'package:erp_app2/hidden_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences prefs;
  
   @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }
  

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _obscureText1 = true;

  // ignore: unused_field
  String _password = '';

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText1 = !_obscureText1;

    });
  }

  void _submitForm() {
    if (_formkey.currentState!.validate()) {}
  }

  String? _validateUsername(value) {
    if (value!.isEmpty) {
      return 'Please enter an username';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Future<void> login() async{
  //   final String endpoint = '';
  //   final response = await
  // }

  String? emailn;
  // Future<void> login() async {
  //   final String endpoint =
  //       "https://aeronex-auth-prod.onrender.com/api/v1/auth/login";
  //   var usernameController;
  //   final response = await http.post(Uri.parse(endpoint),
  //       body: ({
  //         'username': usernameController.text,
  //         'password': passwordController.text,
  //       }));
  //   print(response.body);
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(response.body),
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body.toString());
  //     print(data['token']);
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HiddenDrawer()));
  //   } else {
  //     print("error");
  //   }
  // }




Future<void> login() async {
  final String endpoint = "https://erp.anaskhan.site/api/login/";

  // Validate username
  if (emailController.text.isEmpty) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Invalid Username"),
          content: Text("Please enter a valid username"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
    return;
  }

  try {
    final response = await http.post(Uri.parse(endpoint), body: {
      'email': emailController.text,
      'password': passwordController.text,
    });

    print(response.body);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.body),
      ),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      var myToken = data['token'];
      prefs.setString('token' , myToken);

      print(data['token']);
      print('login succesfully');

       await sendTokenToAdmin(myToken);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HiddenDrawer(token: myToken,)));
    } else {
      print("error");
    }
  } catch (e) {
    print("Exception occurred: $e");

    // Handle the error here, show an error dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("An error occurred during login. Please try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

// Function to send token in the header to the admin
Future<void> sendTokenToAdmin(String token) async {
  final adminEndpoint = 'https://erp.anaskhan.site/api/show_attendance_report/';

  final response = await http.get(
    Uri.parse(adminEndpoint),
    headers: {
      'Token': '$token',
    },
  );

  // Handle the response as needed
  print(response.statusCode);
  print(response.body);
}



// Validate username function (you can customize the validation logic)
// bool _validateUsername(String username) {
//   return username.isNotEmpty; // Add your validation logic here
// }





  // Future<void> signUserIn() async {
  //   print("called");

  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       });

  //   try {
  //     print("remote");
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );

  //     // Check if the user's email is verified
  //     User? user = FirebaseAuth.instance.currentUser;
  //     if (user != null && !user.emailVerified) {
  //       await user.sendEmailVerification();
  //       // Show a message to the user to check their email for verification
  //       //  showInfoMessage(context, "A verification email has been sent. Please check your email.");
  //     }

  //     print("return............");
  //     // ignore: use_build_context_synchronously
  //     // Navigator.pushReplacement(
  //     //   context,
  //     //   MaterialPageRoute(
  //     //     builder: (context) => Homepage(),
  //     //   ),
  //     // );

  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => HomeScreen(),
  //       ),
  //       (route) => false, // This will remove all existing routes from the stack
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     showErrorMessage(e.code);
  //   }
  // }

  String? validatePassword(value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  void showInfoMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ));
        });
  }

 

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(

          // image: DecorationImage(
          //   image: AssetImage("assets/images/Login screen 2 phone (2).png"),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 290,
                      width: 400,
                      child: Lottie.network(
                          'https://lottie.host/e812138e-b6b4-4c4c-b187-b3b402574740/3qniRfkxZa.json'
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              height: h * 0.05,
                            ),
                            Text(
                              "LOGIN PAGE",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                               validator: _validateUsername,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: emailController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurpleAccent),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurpleAccent),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: 'Email',
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                                fillColor: Colors.grey[200],
                                filled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              // validator: validatePassword,
                              controller: passwordController,
                              obscureText: _obscureText1,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurpleAccent),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurpleAccent),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: 'Enter Password',
                                  labelText: " Enter Password",
                                  labelStyle: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  suffixIconConstraints: BoxConstraints(
                                    minHeight: 10,
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: _toggle,
                                      icon: _obscureText1
                                          ? Icon(
                                              Icons.remove_red_eye_rounded,
                                            )
                                          : Icon(
                                              Icons.remove_red_eye_outlined))),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            // ElevatedButton.icon(
                            //   onPressed:(){
                            //     if (_formkey.currentState!.validate())
                            //       signUserIn();
                            //     },
                            //   icon: Icon(Icons.arrow_circle_right),
                            //   label: Text("Login"),
                            // ),

                            InkWell(
                              onTap: () {
                                if (_formkey.currentState!.validate())
                                  login();
                                 
                              
                          
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(bottom: 18),
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
                                        Color.fromARGB(255, 51, 113, 165),
                                        Color.fromARGB(255, 116, 235, 245),
                                      ]),
                                ),
                                child: Text(
                                  'LOGIN',
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
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ElevatedButton.icon(
                          //   onPressed: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => const SignUP(),
                          //         ));
                          //   },
                          //   label: Text("Signup"),
                          //   icon: const Icon(
                          //     Icons.arrow_back_sharp,
                          //   ),
                          // ),

                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return ForgotPasswordPage();
                              //     },
                              //   ),
                              // );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 4, 155, 185),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(children: [
                          Expanded(
                              child: Divider(
                            thickness: 0.7,
                            color: Colors.white,
                          )),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 0.5,
                            color: Colors.white,
                          )),
                        ])),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
