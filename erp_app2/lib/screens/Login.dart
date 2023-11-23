import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

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
  void initState() {
    super.initState();
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
                      height: 280,
                      width: 400,
                      child: Lottie.network('https://lottie.host/e812138e-b6b4-4c4c-b187-b3b402574740/3qniRfkxZa.json'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              validator: _validateEmail,
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
                                labelText: " Email",
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
                              validator: validatePassword,
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
                                        ]
                                        ),
                                        ),
                                        child: Text('LOGIN', 
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
