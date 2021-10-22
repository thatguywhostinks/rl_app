import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

Map accountNullImageAndRegion (data) {
  for (var i = 0; i < data['teams'].length; i++){
    if (data['teams'][i]['team'].containsKey('image') == false) {
      data['teams'][i]['team']['image'] = 'assets/bigTurbo.jpg';
    }
    if (data['teams'][i]['team'].containsKey('region') == false){
      data['teams'][i]['team']['region'] = 'None';
    }
  }
  return data;
}

//Calling this function gets a Map of Maps for all "active" teams
// key of "teams" has corresponding value in form of a List

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