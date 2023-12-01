import 'package:flutter/material.dart';

class Faculty_Page extends StatefulWidget {
  const Faculty_Page({super.key});

  @override
  State<Faculty_Page> createState() => _Faculty_PageState();
}

class _Faculty_PageState extends State<Faculty_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CircularProgressIndicator(),
      ),
    );
  }
}