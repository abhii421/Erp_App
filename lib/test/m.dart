// import 'dart:ui';

// import 'package:flutter/material.dart';

// class BackgroundWaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();

//     final p0 = size.height * 0.45;
//     path.lineTo(0, 0);

//     final controlPoint = Offset(size.width * 0.5, size.height);
//     final endPoint = Offset(size.width, size.height / 2);
//     path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

//     path.lineTo(size.width, 0);
//     final p1 = size.width * 3;
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true; // Implement your logic for when to reclip
//   }
// }


// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ClipPath(
//             clipper: BackgroundWaveClipper(),
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 280,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
