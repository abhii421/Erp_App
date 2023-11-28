// // import 'dart:io';
// // import 'package:dio/dio.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// // class AddPostScreen extends StatefulWidget {
// //   const AddPostScreen({Key? key}) : super(key: key);

// //   @override
// //   _AddPostScreenState createState() => _AddPostScreenState();
// // }

// // class _AddPostScreenState extends State<AddPostScreen> {
// //   bool showSpinner = false;
// //   File? _image;
// //   final picker = ImagePicker();
// //   TextEditingController titleController = TextEditingController();
// //   TextEditingController descriptionController = TextEditingController();

// //   Future getImageGallery() async {

// //      final PickedFile = await picker.pickImage(source: ImageSource.gallery);
// //     setState(() {
// //       if(PickedFile != null){
// //         _image = File(PickedFile.path);
// //       }
// //       else{
// //         print('no image select');
// //       }
      
// //     });
// //     // Your existing code for getting an image from the gallery
// //   }

// //   Future getCameraImage() async {

// //      final PickedFile = await picker.pickImage(source: ImageSource.camera);
// //     setState(() {
// //       if(PickedFile != null){
// //         _image = File(PickedFile.path);
// //       }
// //       else{
// //         print('no image select');
// //       }
      
// //     });
// //     // Your existing code for getting an image from the camera
// //   }

// //   void dialog(context) {

// //     showDialog(
// //       context: context, 
// //       builder: (BuildContext context){
// //         return AlertDialog(
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(10.0)
// //           ),
// //           content: Container(
// //             height: 120,
// //             child: Column(
// //               children: [
// //                 InkWell(
// //                   onTap: (){
// //                     getCameraImage();
// //                     Navigator.pop(context);

// //                   },
// //                   child: ListTile(
// //                     leading: Icon(Icons.camera),
// //                     title: Text('Camera'),
                
// //                   ),
// //                 ),

// //                 InkWell(
// //                   onTap: (){
// //                     getImageGallery();

                    
// //                     Navigator.pop(context);
                    
// //                   },
// //                   child: ListTile(
// //                     leading: Icon(Icons.photo_library),
// //                     title: Text('Gallery'),
                
// //                   ),
// //                 )

// //               ],
// //             ),
// //           ),

// //         );
// //       }
// //       );
// //     // Your existing code for the image selection dialog
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return ModalProgressHUD(
// //       inAsyncCall: showSpinner,
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Upload Post'),
// //           centerTitle: true,
// //         ),
// //         body: SingleChildScrollView(
// //           child: Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Column(
// //               children: [
// //                 // Your existing code for image selection
// //                 SizedBox(height: 30),
// //                 Form(
// //                   child: Column(
// //                     children: [
// //                       // Your existing code for text form fields
// //                       SizedBox(height: 30),
// //                       InkWell(
// //                         onTap: () async {
// //                           setState(() {
// //                             showSpinner = true;
// //                           });

// //                           try {
// //                             // Your existing code for uploading image to Firebase Storage
// //                             // ...

// //                             // Replace the following with your API endpoint and token logic
// //                             final dio = Dio();
// //                             dio.options.headers["Authorization"] = "Bearer YOUR_TOKEN_HERE";

// //                             // Replace the following with your API endpoint
// //                             final response = await dio.post(
// //                               'YOUR_API_ENDPOINT_HERE',
// //                               data: {
// //                                 'title': titleController.text,
// //                                 'description': descriptionController.text,
// //                                 // Other data fields
// //                               },
// //                             );

// //                             // Handle the API response as needed
// //                             print(response.data);

// //                             setState(() {
// //                               showSpinner = false;
// //                             });
// //                           } catch (e) {
// //                             setState(() {
// //                               showSpinner = false;
// //                             });
// //                             // Handle errors
// //                             print(e.toString());
// //                           }
// //                         },
// //                         child: Container(
// //                           // Your existing code for the upload button
// //                           // ...
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }





// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({Key? key});

//   @override
//   State<AddPostScreen> createState() => _AddPostScreenState();
// }

// class _AddPostScreenState extends State<AddPostScreen> {
//   bool showSpinner = false;
//   File? _image;
//   final picker = ImagePicker();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();

//   Future getImageGallery() async {
//     final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedImage != null) {
//         _image = File(pickedImage.path);
//       } else {
//         print('no image selected');
//       }
//     });
//   }

//   Future getCameraImage() async {
//     final XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
//     setState(() {
//       if (pickedImage != null) {
//         _image = File(pickedImage.path);
//       } else {
//         print('no image selected');
//       }
//     });
//   }

//   void dialog(context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//           content: Container(
//             height: 120,
//             child: Column(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     getCameraImage();
//                     Navigator.pop(context);
//                   },
//                   child: ListTile(
//                     leading: Icon(Icons.camera),
//                     title: Text('Camera'),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     getImageGallery();
//                     Navigator.pop(context);
//                   },
//                   child: ListTile(
//                     leading: Icon(Icons.photo_library),
//                     title: Text('Gallery'),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: showSpinner,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Upload post'),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     dialog(context);
//                   },
//                   child: Center(
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.2,
//                       width: MediaQuery.of(context).size.width * 1,
//                       child: _image != null
//                           ? ClipRRect(
//                               child: Image.file(
//                                 _image!,
//                                 height: 100,
//                                 width: 100,
//                                 fit: BoxFit.fill,
//                               ),
//                             )
//                           : Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade200,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               width: 100,
//                               height: 100,
//                               child: Icon(
//                                 Icons.camera_alt,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Form(
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: titleController,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           labelText: 'Title',
//                           hintText: 'Enter post title',
//                           border: OutlineInputBorder(),
//                           hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
//                           labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
//                         ),
//                       ),
//                       SizedBox(height: 30),
//                       TextFormField(
//                         controller: descriptionController,
//                         keyboardType: TextInputType.text,
//                         minLines: 1,
//                         maxLength: 25,
//                         decoration: InputDecoration(
//                           labelText: 'Description',
//                           hintText: 'Enter post description',
//                           border: OutlineInputBorder(),
//                           hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
//                           labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
//                         ),
//                       ),
//                       SizedBox(height: 30),
//                       InkWell(
//                         onTap: () async {
//                           setState(() {
//                             showSpinner = true;
//                           });

//                           try {
//                             Dio dio = Dio();
//                             dio.options.headers["Content-Type"] = "application/json";

//                             // Replace 'API_ENDPOINT_HERE' with your actual API endpoint
//                             final response = await dio.post(
//                               'https://erp.anaskhan.site/api/events/',
//                               data: {
//                                 'title': titleController.text,
//                                 'description': descriptionController.text,
//                                 'image': _image!.path,
//                                 // Add additional parameters if needed
//                               },
//                             );

//                             print(response.data);

//                             setState(() {
//                               showSpinner = false;
//                             });
//                           } catch (e) {
//                             setState(() {
//                               showSpinner = false;
//                             });
//                             // Handle errors
//                             print(e.toString());
//                           }
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(bottom: 8),
//                           width: 200,
//                           padding: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black),
//                             borderRadius: BorderRadius.circular(15),
//                             color: const Color.fromARGB(255, 173, 157, 204),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Image.asset(
//                                 "assets/images/icons8-camera-64 (1).png",
//                                 height: 40,
//                               ),
//                               Text(
//                                 'Upload',
//                                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({Key? key});

//   @override
//   State<AddPostScreen> createState() => _AddPostScreenState();
// }

// class _AddPostScreenState extends State<AddPostScreen> {
//   bool showSpinner = false;
//   File? _image;
//   final picker = ImagePicker();
//   TextEditingController dataController = TextEditingController();

//   Future getImageGallery() async {
//     final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedImage != null) {
//         _image = File(pickedImage.path);
//       } else {
//         print('no image selected');
//       }
//     });
//   }

//   Future getCameraImage() async {
//     final XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
//     setState(() {
//       if (pickedImage != null) {
//         _image = File(pickedImage.path);
//       } else {
//         print('no image selected');
//       }
//     });
//   }

//   void dialog(context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//           content: Container(
//             height: 120,
//             child: Column(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     getCameraImage();
//                     Navigator.pop(context);
//                   },
//                   child: ListTile(
//                     leading: Icon(Icons.camera),
//                     title: Text('Camera'),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     getImageGallery();
//                     Navigator.pop(context);
//                   },
//                   child: ListTile(
//                     leading: Icon(Icons.photo_library),
//                     title: Text('Gallery'),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: showSpinner,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Upload Post'),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     dialog(context);
//                   },
//                   child: Center(
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.2,
//                       width: MediaQuery.of(context).size.width * 1,
//                       child: _image != null
//                           ? ClipRRect(
//                               child: Image.file(
//                                 _image!,
//                                 height: 100,
//                                 width: 100,
//                                 fit: BoxFit.fill,
//                               ),
//                             )
//                           : Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade200,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               width: 100,
//                               height: 100,
//                               child: Icon(
//                                 Icons.camera_alt,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Form(
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: dataController,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           labelText: 'Data',
//                           hintText: 'Enter post data',
//                           border: OutlineInputBorder(),
//                           hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
//                           labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
//                         ),
//                       ),
//                       SizedBox(height: 30),
//                       InkWell(
//                         onTap: () async {
//                           setState(() {
//                             showSpinner = true;
//                           });

//                           try {
//                             Dio dio = Dio();
//                             dio.options.headers["Content-Type"] = "application/json";

//                             final response = await dio.post(
//                               'https://erp.anaskhan.site/api/events/',
//                               data: {
//                                 'image_url': _image!.path,
//                                 'data': dataController.text,
//                               },
//                             );

//                             print(response.data);

//                             setState(() {
//                               showSpinner = false;
//                             });
//                           } catch (e) {
//                             setState(() {
//                               showSpinner = false;
//                             });
//                             print(e.toString());
//                           }
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(bottom: 8),
//                           width: 200,
//                           padding: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black),
//                             borderRadius: BorderRadius.circular(15),
//                             color: const Color.fromARGB(255, 173, 157, 204),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Image.asset(
//                                 "assets/images/icons8-camera-64 (1).png",
//                                 height: 40,
//                               ),
//                               Text(
//                                 'Upload',
//                                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool showSpinner = false;
  File? _image;
  final picker = ImagePicker();
  TextEditingController dataController = TextEditingController();

  Future getImageGallery() async {
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('no image selected');
      }
    });
  }

  Future getCameraImage() async {
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('no image selected');
      }
    });
  }

  void dialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: Container(
            height: 120,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    getCameraImage();
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Camera'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    getImageGallery();
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gallery'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Upload Post'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    dialog(context);
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 1,
                      child: _image != null
                          ? ClipRRect(
                              child: Image.file(
                                _image!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color:  Color.fromARGB(255, 172, 161, 202),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.camera_alt,
                                size: 35,
                                color: Colors.blue,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: dataController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Data',
                          hintText: 'Enter post data',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                          labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(height: 30),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            showSpinner = true;
                          });

                          try {
                            Dio dio = Dio();
                            dio.options.headers["Content-Type"] = "application/json";

                            // Create a FormData object to wrap the image file
                            FormData formData = FormData.fromMap({
                              'image': await MultipartFile.fromBytes(_image!.readAsBytesSync(), filename: 'image.png'),
                              'data': dataController.text,
                            });

                            // Replace 'YOUR_API_ENDPOINT_HERE' with your actual API endpoint
                            final response = await dio.post(
                              'https://erp.anaskhan.site/api/events/',
                              data: formData,
                            );

                            print(response.data);

                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            setState(() {
                              showSpinner = false;
                            });
                            print(e.toString());
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 8),
                          width: 200,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 173, 157, 204),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/images/icons8-camera-64 (1).png",
                                height: 40,
                              ),
                              Text(
                                'Upload',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
