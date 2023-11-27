import 'package:flutter/material.dart';

// token_manager.dart

import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String _tokenKey = 'token';

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_tokenKey, token);
  }

  static Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_tokenKey);
  }
}
