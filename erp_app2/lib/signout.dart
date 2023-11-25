import 'package:erp_app2/screens/Login.dart';
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
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('New Screen'),
      // ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Call the clearToken method when signing out
            await TokenModel.clearToken();
            // Navigate to the login screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}


