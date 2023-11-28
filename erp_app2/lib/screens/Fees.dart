import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class YourClassName extends StatefulWidget {
  @override
  _YourClassNameState createState() => _YourClassNameState();
}

class _YourClassNameState extends State<YourClassName> {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoic3R1ZGVudDAxIiwicm9sZSI6InN0dWRlbnQifQ.UkULa-lSkrgCyxlHi106ocV1261_YpI3tFbxRfk09lg';

  dynamic amount = 0.0;
  dynamic paid = 0.0;
  dynamic due = 0.0;
  String date = '';

  Future<void> fetchData() async {
    var headers = {'Token': token};
    var request =
        http.Request('GET', Uri.parse('https://erp.anaskhan.site/api/my_fee/'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data = await response.stream.bytesToString();
      // Parse the JSON response
      Map<String, dynamic> jsonData = json.decode(data);

      // Update variables with fetched data
      amount = jsonData['amount'];
      paid = jsonData['paid'];
      due = jsonData['due'];
      date = jsonData['date'];
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Display your data here
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Amount: $amount'),
                  // Text('Paid: $paid'),
                  // Text('Due: $due'),
                  // Text('Date: $date'),

                  Text(
                    'Amount: ${amount?.toDouble() ?? 0.0}',
                    style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Paid: ${paid?.toDouble() ?? 0.0}',
                    style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Due: ${due?.toDouble() ?? 0.0}',
                    style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Date: $date',
                    style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
