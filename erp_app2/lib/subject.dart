import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  final String subject;
  final int? totalPresent;
  final int? totalAbsent;

  SubjectScreen({
    required this.subject,
    required this.totalPresent,
    required this.totalAbsent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subject: $subject'),
            Text('Total Present: ${totalPresent ?? 'N/A'}'),
            Text('Total Absent: ${totalAbsent ?? 'N/A'}'),
            
          ],
        ),
      ),
    );
  }
}
