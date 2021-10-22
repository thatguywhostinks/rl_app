import 'package:http/http.dart';
import 'dart:convert';

class EventData{
  List? eventList;

  Future<void> getEventData(region) async {

    try {
      Map data;
      Response response = await get(Uri(scheme: 'https',host: 'zsr.octane.gg',
          path: '/teams', queryParameters:{'region': region}));
      data = jsonDecode(response.body);
      print(data);
    }
    catch (e) {
      print('Failed to get event data: $e');
      eventList = [0];
    }


  }


}
