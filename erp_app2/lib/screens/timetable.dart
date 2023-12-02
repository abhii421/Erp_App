// import 'dart:convert';
// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';

// class Timetable extends StatefulWidget {
//   const Timetable({super.key});

//   @override
//   State<Timetable> createState() => _TimetableState();
// }

// class _TimetableState extends State<Timetable> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDate;
//   final titleContoller = TextEditingController();
//   final descriptionController = TextEditingController();
//   Map<String, List> mySelectedEvents = {};

//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = _focusedDay;
//     loadPreviousEvents;
//   }

//   loadPreviousEvents() {
//     mySelectedEvents = {
//       "2023-12-27": [
//         {"eventTitle": "blockverse", "eventDescription": "party"},
//       ],
//       "2023-12-27": [
//         {"eventTitle": "Add ", "eventDescription": "party"}
//       ]
//     };
//   }

//   List _listofDayEvents(DateTime dateTime) {
//     if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
//       return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
//     } else {
//       return [];
//     }
//   }

//   _showAddEventsDialog() async {
//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(
//           "Add new Events",
//           textAlign: TextAlign.center,
//         ),
//         content: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: titleContoller,
//               textCapitalization: TextCapitalization.words,
//               decoration: InputDecoration(labelText: 'Title'),
//             ),
//             TextField(
//               controller: descriptionController,
//               textCapitalization: TextCapitalization.words,
//               decoration: InputDecoration(labelText: 'Description'),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 if (titleContoller.text.isEmpty &&
//                     descriptionController.text.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                     content: Text('fill required fields'),
//                     duration: Duration(seconds: 2),
//                   ));
//                   return;
//                 } else {
//                   print(titleContoller.text);
//                   print(descriptionController.text);

//                   setState(() {
//                     if (mySelectedEvents[DateFormat('yyyy-MM-dd')
//                                 .format(_selectedDate!)] !=
//                             null //means already an event exist on that date

//                         ) {
//                       mySelectedEvents[
//                               DateFormat('yyyy-MM-dd').format(_selectedDate!)]
//                           ?.add({
//                         "eventTitle": titleContoller.text,
//                         "eventDescription": descriptionController
//                             .text, // here i add another event in map
//                       });
//                     } else {
//                       mySelectedEvents[
//                           DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
//                         {
//                           "eventTitle": titleContoller.text,
//                           "eventDescription": descriptionController.text,
//                         }
//                       ];
//                     }
//                   });

//                   print(
//                       'new Event i give to anas is ${json.encode(mySelectedEvents)} ');

//                   titleContoller.clear();
//                   descriptionController.clear();
//                   Navigator.pop(context);
//                   return;
//                 }
//               },
//               child: Text('Add Event')),
//           TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel')),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TableCalendar(
//               calendarStyle: CalendarStyle(
//                 defaultTextStyle: TextStyle(color: Colors.blue),
//                 weekNumberTextStyle: TextStyle(color: Colors.red),
//                 weekendTextStyle: TextStyle(color: Colors.pink),
//               ),

//               focusedDay: _focusedDay, // focus current day
//               firstDay: DateTime(2023),
//               lastDay: DateTime(2024),
//               calendarFormat: _calendarFormat,

//               onDaySelected: (selectedDay, focusedDay) {
//                 if (!isSameDay(_selectedDate, selectedDay)) {
//                   // call setsa. to update selected day

//                   setState(() {
//                     _selectedDate = selectedDay;
//                     _focusedDay = focusedDay;
//                   });
//                 }
//               },

//               selectedDayPredicate: (day) {
//                 return isSameDay(_selectedDate, day);
//               },

//               onFormatChanged: (format) {
//                 if (_calendarFormat != format) {
//                   setState(() {
//                     _calendarFormat = format;
//                   });
//                 }
//               },

//               onPageChanged: (focusedDay) {
//                 _focusedDay = focusedDay;
//               },

//               eventLoader: _listofDayEvents,
//             ),
//             ..._listofDayEvents(_selectedDate!).map((myEvent) => ListTile(
//                   leading: const Icon(
//                     Icons.done,
//                     color: Colors.green,
//                   ),
//                   title: Padding(
//                     padding: EdgeInsets.only(bottom: 10),
//                     child: Text('EventTitle:   ${myEvent['eventTitle']}'),
//                   ),
//                   subtitle:
//                       Text('Description :   ${myEvent['eventDescription']}'),
//                 )),
//             SizedBox(
//               height: 80,
//             ),
//             InkWell(
//               onTap: () {
//                 _showAddEventsDialog();
//               },
//               child: Container(
//                   alignment: Alignment.center,
//                   height: 50,
//                   width: 120,
//                   decoration: BoxDecoration(
//                       color: Colors.cyan,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(0.0),
//                     child: Text(
//                       "add events",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }







import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Timetable extends StatefulWidget {
  const Timetable({Key? key});

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  Map<String, List<Map<String, String>>> mySelectedEvents = {};

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
    loadPreviousEvents();
  }

  loadPreviousEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? eventsJson = prefs.getString('events');
    if (eventsJson != null) {
      setState(() {
        mySelectedEvents = (json.decode(eventsJson) as Map<String, dynamic>).map(
          (key, value) => MapEntry(
            key,
            (value as List<dynamic>).map(
              (item) => Map<String, String>.from(item),
            ).toList(),
          ),
        );
      });
    }
  }

  saveEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('events', json.encode(mySelectedEvents));
  }

  List _listofDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  _showAddEventsDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Add new Events",
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descriptionController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('fill required fields'),
                  duration: Duration(seconds: 2),
                ));
                return;
              } else {
                print(titleController.text);
                print(descriptionController.text);

                setState(() {
                  String selectedDate = DateFormat('yyyy-MM-dd').format(_selectedDate!);

                  mySelectedEvents[selectedDate] ??= [];

                  mySelectedEvents[selectedDate]!.add({
                    "eventTitle": titleController.text,
                    "eventDescription": descriptionController.text,
                  });

                  saveEvents(); // Save events to shared preferences
                });

                print('new Event is ${json.encode(mySelectedEvents)} ');

                titleController.clear();
                descriptionController.clear();
                Navigator.pop(context);
                return;
              }
            },
            child: Text('Add Event'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(color: Colors.blue),
                weekNumberTextStyle: TextStyle(color: Colors.red),
                weekendTextStyle: TextStyle(color: Colors.pink),
              ),
              focusedDay: _focusedDay, // focus current day
              firstDay: DateTime(2023),
              lastDay: DateTime(2024),
              calendarFormat: _calendarFormat,
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDate, selectedDay)) {
                  // call set state to update the selected day
                  setState(() {
                    _selectedDate = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              eventLoader: _listofDayEvents,
            ),
            ..._listofDayEvents(_selectedDate!).map((myEvent) => ListTile(
              leading: const Icon(
                Icons.done,
                color: Colors.green,
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text('EventTitle:   ${myEvent['eventTitle']}'),
              ),
              subtitle: Text(
                  'Description :   ${myEvent['eventDescription']}'),
            )),
            SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: () {
                _showAddEventsDialog();
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    "add events",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}







