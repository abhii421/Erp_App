

import 'dart:convert';
import 'package:erp_app2/Events/add_post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  List<Map<String, dynamic>> eventData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('GET', Uri.parse('https://erp.anaskhan.site/api/events/'));
    request.body = json.encode({"id": "all"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data = await response.stream.bytesToString();
      List<dynamic> jsonData = json.decode(data);

      setState(() {
        eventData = List<Map<String, dynamic>>.from(jsonData);
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        //  Scaffold(

        //   body: eventData.isEmpty
        //       ? Center(
        //           child: CircularProgressIndicator(),
        //         )
        //       : ListView.builder(
        //           itemCount: eventData.length,
        //           itemBuilder: (context, index) {
        //             return ListTile(
        //               title: Text(eventData[index]['description']),
        //               subtitle: Image.network(
        //                 eventData[index]['image_url'],
        //                 height: 100,
        //                 width: 100,
        //               ),
        //             );
        //           },
        //         ),
        // );

        Scaffold(
      body: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           

            SizedBox(
              height: 5,
            ),
            // TextFormField(
            //   controller: searchController,
            //   keyboardType: TextInputType.emailAddress,
            //   decoration: InputDecoration(
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.deepPurpleAccent),
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.deepPurpleAccent),
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     hintText: 'Search with blog title',
            //     labelText: " Search",
            //     prefixIcon: Icon(Icons.search),
            //     border: OutlineInputBorder(),
            //     labelStyle: TextStyle(
            //       color: Colors.black54,
            //     ),
            //     fillColor: Colors.grey[200],
            //     filled: true,
            //   ),
            //   onChanged: (String value) {
            //     setState(() {
            //       search = value;
            //     });
            //   },
            // ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: eventData.length, // Only one item for the single map
                itemBuilder: (BuildContext context, int index) {
                  String tempTitle = eventData[index]['description'];
                  print('data = $tempTitle');

                  // if (searchController.text.isEmpty ||
                  //     tempTitle
                  //         .toLowerCase()
                  //         .contains(searchController.text.toLowerCase())) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 206, 246, 197),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              eventData[index]['image_url'],
                              // height: 100,
                              //  width: 100,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.28,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              tempTitle,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

             Padding(
               padding: const EdgeInsets.only(left: 230, top: 500),
               child: Container(
                
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   gradient: LinearGradient(
                //     begin: Alignment.centerLeft,
                //     end: Alignment.bottomCenter,
                //     colors: <Color>[
                //       Color.fromARGB(255, 184, 102, 236),
                //       Color.fromARGB(255, 140, 233, 244),
                //     ],
                //   ),
                // ),
                // child: Padding(
                //   padding: const EdgeInsets.all(1.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Text(
                //         'Add Events',
                //         style: TextStyle(fontSize: 24),
                //       ),
                //       InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => AddPostScreen(),
                //             ),
                //           );
                //         },
                //         child: Image.asset(
                //           'assets/images/icon.png',
                //           height: 60,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
             
                child:InkWell(
                  
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddPostScreen(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/icon.png',
                          height: 150,
                        ),
                      ),
             
               ),
             ),
          ],
        ),
      ),
    );
  }
}
