import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class EventData{
  List? eventList;
  Future<void> getEventData({region,afterDate,tier}) async {

    try {
      Map data;
      // with qParams
      // Response response = await get(Uri(scheme: 'https',host: 'zsr.octane.gg',
      //     path: '/events', queryParameters:{'region': region, 'after': afterDate, 'tier' : tier}));
      // without qParams
      Response response = await get(Uri(scheme: 'https',host: 'zsr.octane.gg',
          path: '/events', queryParameters:{'perPage': '300', 'page': '1','after': '2021-01-01'}));

      data = jsonDecode(response.body);
      eventList = data['events'];
    }
    catch (e) {
      print('Failed to get event data: $e');
      eventList = [0];
    }

  }
}

class EventCard extends EventData{
  String? eventName;
  String? region;
  String? tier;
  String? eventImg;
  String? startDate;
  String? endDate;
  EventCard({this.eventName,this.region,this.tier, this.eventImg, this.startDate, this.endDate});
}

List<EventCard> getEventCardDataList(eventList) {
  Map currentEvent;
  List<EventCard> listOfEventCardData = [];
  //account for no img, and endDate
  //all other fields must exist to have an entry.
  for (var i = 0; i < eventList.length; i++) {
    currentEvent = eventList[i];
    if (currentEvent.containsKey('image') == false) {
      currentEvent['image'] = 'assets/lottie/57092-wheel-rotation.json';
    }
    if (currentEvent.containsKey('endDate') == false) {
      currentEvent['endDate'] = '';
    }

    //converting startDate and endDate into DateTime's for easy formatting
    //manipulation.
    currentEvent['startDate']
    = DateFormat.yMMMd().format(extractDateTime(currentEvent['startDate']));
    if (currentEvent['endDate'] != '') {
      currentEvent['endDate']
      = DateFormat.yMMMd().format(extractDateTime(currentEvent['endDate']));
    }

    listOfEventCardData.add(EventCard(
      eventName: currentEvent['name'],
      region: currentEvent['region'],
      tier: currentEvent['tier'],
      eventImg: currentEvent['image'],
      startDate: currentEvent['startDate'],
      endDate: currentEvent['endDate']
    ));
  }
  return listOfEventCardData;
}

DateTime extractDateTime(stringDate) {
  var year = int.parse(stringDate.substring(0,4));
  var month = int.parse(stringDate.substring(5,7));
  var day = int.parse(stringDate.substring(8,10));

  DateTime dateTimeObject = DateTime(year,month,day);
  return dateTimeObject;
}