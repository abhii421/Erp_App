// import 'package:flutter/material.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';

// class New extends StatefulWidget {
//   final token;
//   const New({Key ? key, @required this.token}) : super(key: key);

//   @override
//   State<New> createState() => _NewState();
// }

// class _NewState extends State<New> {x

//   late String email;
//   @override
//   void initState(){

//     super.initState();

//   //  Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
//   //   email = jwtDecodedToken['email'] ?? 'DefaultEmail'; 
//         Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

//     email = jwtDecodedToken['email'];


//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(email),
      
//           ],
//         ),
//       ),
//     );
//   }
// }