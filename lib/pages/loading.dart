import 'package:flutter/material.dart';
import 'package:rl_app/services/get_active_teams.dart';
import 'package:rl_app/services/get_events.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  TeamData teamsList = TeamData();
  EventData test = EventData();
  void setupTeamCardData() async {
    await teamsList.getTeamData();
    List<FavoriteCardData> activeTeamData = getFavoriteCardDataList(teamsList.teamsList);
    Navigator.pushReplacementNamed(context, '/fav_team_select', arguments: {
      'teamsList': activeTeamData,
    });
  }
  //CAN COMMENT OUT FOR NOW TO TEST OTHER PAGES
  // @override
  //   void initState() {
  //     super.initState();
  //     setupTeamCardData();
//   }
  //**************TESTING BLOCK****************
  void setupEventSchedule() async {
    List<EventCard> EventCardList;
    await test.getEventData(region: 'NA', afterDate: '2021-10-01',tier: 'A');
    EventCardList = getEventCardDataList(test.eventList);
    Navigator.pushReplacementNamed(context, '/event_schedule', arguments: {'events': EventCardList});
  }

  // @override
  //   void initState() {
  //   super.initState();
  //   setupEventSchedule();
  // }
//********************************************



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitCircle(color: Colors.red),
    );
  }
}
