import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FacultySidePlacement extends StatefulWidget {
  const FacultySidePlacement({super.key});

  @override
  State<FacultySidePlacement> createState() => _FacultySidePlacementState();
}

class _FacultySidePlacementState extends State<FacultySidePlacement> {

  TextEditingController UsernameController = TextEditingController();
  TextEditingController placed_or_not = TextEditingController();
  TextEditingController encouragement_prize_to_be_given = TextEditingController();
  TextEditingController placement_mode = TextEditingController();
  TextEditingController Company_name = TextEditingController();
  TextEditingController Package = TextEditingController();

  @override
  
  Future <void> uploadPlacementData() async{
    
    try{

      var header = {
        'Token' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoidGVhY2hlcjAxIiwicm9sZSI6ImZhY3VsdHkifQ.DJTBSU2988OOziUI5bvyuUAFIb4wsrBfMdDzcXbghvs'
      };
      
      
      final responsenew = await http.post(Uri.parse('https://erp.anaskhan.site/api/placement/'),
        headers: header,
        body : {
          "username" : UsernameController,
          "placed" : placed_or_not,
          "encouragement_prize_to_be_given" : encouragement_prize_to_be_given,
          "placement_mode" : placement_mode,
          "Company_name" : Company_name,
          "Package" : Package
        }
      );
      
      
    } catch (error){
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
                controller: UsernameController,
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

                controller: placed_or_not,
                decoration: InputDecoration(
                    hintText: '  placed--yes/no',
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

                controller: encouragement_prize_to_be_given,
                decoration: InputDecoration(
                    hintText: ' encouragement prize -- yes/no',
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

                controller: placement_mode,
                decoration: InputDecoration(
                    hintText: ' on_campus/off_campus',
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

                controller: Company_name,
                decoration: InputDecoration(
                    hintText: ' Company name',
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

                controller: encouragement_prize_to_be_given,
                decoration: InputDecoration(
                    hintText: ' encouragement prize -- yes/no',
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                ),
              )
          ),

          SizedBox(height : 60),
          ElevatedButton(onPressed: (){
            uploadPlacementData();
          },
              child: Text('Issue Book'))
        ],
      )


    );
  }
}
