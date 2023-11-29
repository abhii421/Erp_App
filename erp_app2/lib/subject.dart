// import 'package:flutter/material.dart';

// class SubjectScreen extends StatelessWidget {
//   final String subject;
//   final int? totalPresent;
//   final int? totalAbsent;

//   SubjectScreen({
//     required this.subject,
//     required this.totalPresent,
//     required this.totalAbsent,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(subject, style: TextStyle(
//             fontSize: 24, 
            
//         ),),
//         backgroundColor: const Color.fromARGB(255, 177, 141, 239),
//         // toolbarHeight: 80,
//       ),
//       body: 
//         Container(
      
//            decoration: const BoxDecoration(
      
//             image: DecorationImage(
//               image: AssetImage("assets/images/Login screen 2 phone (2).png"),
//               fit: BoxFit.cover,
//             ),
//           ),
          
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Subject: $subject'),
//                 Text('Total Present: ${totalPresent ?? 'N/A'}'),
//                 Text('Total Absent: ${totalAbsent ?? 'N/A'}'),
                
//               ],
//             ),
//           ),
//         ),
      
//     );
//   }
// }


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
        title: Text(
          subject,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 183, 146, 247), // Make the AppBar transparent
        toolbarHeight: 80,
        elevation: 0, 
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Frame 289295.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 140, left: 40, bottom: 60),
                child: Text('Subject: $subject', style: TextStyle( color: Color.fromARGB(255, 255, 255, 255), fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text('Total Present: ${totalPresent ?? 'N/A'}' , style: TextStyle( color: Color.fromARGB(255, 255, 255, 255), fontSize: 17, fontWeight: FontWeight.normal),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text('Total Absent: ${totalAbsent ?? 'N/A'}' , style: TextStyle( color: Color.fromARGB(255, 255, 255, 255), fontSize: 17, fontWeight: FontWeight.normal),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
