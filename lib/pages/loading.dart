import 'package:flutter/material.dart';
import 'package:rl_app/services/get_active_teams.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

List<FavoriteCardData> getFavoriteCardDataList(teamsList) {
  List<FavoriteCardData> listOfFavoriteCardData = [];
  Map currentTeam;
  String playerTagList;
  print(teamsList.length);
  for (var i = 0; i < teamsList.length; i++) {
    currentTeam = teamsList[i];
    if (currentTeam['players'].length < 3) {
      playerTagList = 'None Found';
    }
    else {
      playerTagList = '${currentTeam['players'][0]['tag']}, ${currentTeam['players'][1]['tag']}, ${currentTeam['players'][2]['tag']}';
    }
    listOfFavoriteCardData.add(FavoriteCardData(currentTeam['team']['name'],
        playerTagList,
        currentTeam['team']['region'],
        currentTeam['team']['image']));
  }
  return listOfFavoriteCardData;
}

class _LoadingState extends State<Loading> {
  TeamData teamsList = TeamData();
  void setupTeamCardData() async {
    await teamsList.getTeamData();
    List<FavoriteCardData> activeTeamData = getFavoriteCardDataList(teamsList.teamsList);
    Navigator.pushReplacementNamed(context, '/fav_team_select', arguments: {
      'teamsList': activeTeamData,
    });
  }

  Future<List> accountNullImage(teamListMap) {
    for (var i = 0; i >= teamListMap.length; i++){
      if (teamListMap[i]['team'].containsKey('image') == false) {
        teamListMap[i]['team']['image'] = 'https://griffon.octane.gg/teams/BS+COMPETITION.png';
      }
    }
    return teamListMap;
  }

  @override
  void initState() {
    super.initState();
    setupTeamCardData();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Loading');
  }
}
