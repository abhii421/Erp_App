import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  
  final String Subject;
  final String Attendance;
  const ContainerPage(
      {super.key,
      required this.Subject,
      required this.Attendance});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      
      height: 80,
      width: 350,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 227, 223, 223),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            // Container(
            //   height: 140,
            //   width: 160,
              
            //   padding: const EdgeInsets.all(16),
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            //   child: image,
            // ),
          
            // Icon(
            //     ,
            //     size: 40,
            //   ),
          
            const SizedBox(
              height: 12.0,
            ),
            Text(Subject,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ),),
            SizedBox(height: 8.0),
            Text(
              Attendance,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
