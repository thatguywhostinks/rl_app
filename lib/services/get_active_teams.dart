import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:rl_app/widgets/loading_widget.dart';

Map accountNullImageAndRegion (data) {
  for (var i = 0; i < data['teams'].length; i++){
    if (data['teams'][i]['team'].containsKey('image') == false) {
      data['teams'][i]['team']['image'] = "";
    }
    if (data['teams'][i]['team'].containsKey('region') == false){
      data['teams'][i]['team']['region'] = 'None';
    }
  }
  return data;
}

List<FavoriteCardData> getFavoriteCardDataList(teamsList) {
  List<FavoriteCardData> listOfFavoriteCardData = [];
  Map currentTeam;
  String playerTagList;
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

class TeamData {
  List? teamsList;
  Future<void> getTeamData() async {
    try {
      Map data;
      Response response =
      await get(Uri.parse('https://zsr.octane.gg/teams/active'));
      data = jsonDecode(response.body);
      // print(data['teams']);
      data =  accountNullImageAndRegion(data);
      //Parsing the data to be a List of "team" which is a map
      teamsList =  data['teams'];
    } catch (e) {
      print('Failed to get active team data: $e');
      teamsList = [0];
    }
  }
}

class FavoriteCardData extends TeamData{
  String teamName;
  String playerTagList;
  String region;
  String imgUrl;
  FavoriteCardData(this.teamName,this.playerTagList,this.region,this.imgUrl);
 }