import 'package:flutter/material.dart';
import 'package:rl_app/services/get_events.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class EventSchedule extends StatefulWidget {
  const EventSchedule({Key? key}) : super(key: key);

  @override
  _EventScheduleState createState() => _EventScheduleState();
}

class _EventScheduleState extends State<EventSchedule> {
  Map eventDataMap = {};
  @override
  Widget build(BuildContext context) {
    eventDataMap = eventDataMap.isNotEmpty
        ? eventDataMap
        : ModalRoute.of(context)!.settings.arguments as Map;
    List<EventCard> eventCardData = eventDataMap['events'];
    return Column(
      children: <Widget> [
        Expanded(
          child: ListView.builder(
          itemCount: eventCardData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  leading: SizedBox(
                    width: 60.0,
                    child: Image.network(eventCardData[index].eventImg!,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/bigTurbo.jpg');
                        }, loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Container(
                            child: Lottie.asset(
                              'assets/lottie/57092-wheel-rotation.json',
                            ),
                          );
                        }),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                  title: Text('${eventCardData[index].eventName}'),
                  subtitle: Text(
                  '${eventCardData[index].startDate} - ${eventCardData[index].endDate}'
                  ),
                  )
                )
              );
          }
      ),),
    ]
    );
  }
}
