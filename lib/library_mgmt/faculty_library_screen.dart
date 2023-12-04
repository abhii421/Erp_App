import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FacultyLibraryScreen extends StatefulWidget {

  const FacultyLibraryScreen({Key? key}) : super(key: key);

  @override
  State<FacultyLibraryScreen> createState() => _FacultyLibraryScreenState();
}

class _FacultyLibraryScreenState extends State<FacultyLibraryScreen> {

  TextEditingController booknumberController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();
  TextEditingController usernameController = TextEditingController();


@override


  Future<void> issuebook() async {
    try{
      var header = {
        'Token' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoidGVhY2hlcjAxIiwicm9sZSI6ImZhY3VsdHkifQ.DJTBSU2988OOziUI5bvyuUAFIb4wsrBfMdDzcXbghvs'
      };


      final response2 = await http.post(Uri.parse('https://erp.anaskhan.site/api/issue_book/'),
     headers: header,
      body : {
        "username" : usernameController,
        "book_number" : booknumberController,
        "return_date" : returnDateController
          }
      );

    }
        catch(error)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body : Column(
          children: [
                      SizedBox(height: 50,),
            Container(
                width: 320,
                height: 45,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child : TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: '  Username',
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                  ),
                )
            ),

            SizedBox(height: 30),

            Container(
                width: 320,
                height: 45,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child : TextFormField(

                  controller: booknumberController,
                  decoration: InputDecoration(
                    hintText: '  Book number -- 000',
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                  ),
                )
            ),
            SizedBox(height : 30),
            Container(
                width: 320,
                height: 45,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child : TextFormField(

                  controller: returnDateController,
                  decoration: InputDecoration(
                    hintText: 'return date -- yyyy-mm-dd',
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                  ),
                )
            ),
            
            SizedBox(height : 60),
            ElevatedButton(onPressed: (){
              issuebook();
            },
                child: Text('Issue Book'))
          ],
        )

    );
  }
}
