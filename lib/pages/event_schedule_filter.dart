import 'package:flutter/material.dart';

class EventScheduleFilter extends StatefulWidget {
  const EventScheduleFilter({Key? key}) : super(key: key);

  @override
  _EventScheduleFilterState createState() => _EventScheduleFilterState();
}

class _EventScheduleFilterState extends State<EventScheduleFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(
      child:  TextButton(
          onPressed: () {
            return null;
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            textStyle: const TextStyle(fontSize: 15),
            primary: Colors.white,
            backgroundColor: Colors.lightBlue,
            onSurface: Colors.amber,
          ),
          child: Text('NA')),
    ));
  }
}
