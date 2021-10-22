import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:rl_app/widgets/loading_widget.dart';

Map accountNullImageAndRegion(data) {
  if (!data.containsKey('image')) {
    data['image'] = "";
  }
  return data;
}

class SingleTeamData {
  Map? team;
  Future<void> getSingleTeamData(String teamID) async {
    try {
      Map data;
      Response response = await get(
          Uri(scheme: 'https', host: 'zsr.octane.gg', path: '/teams' + teamID));
      data = jsonDecode(response.body);
      // print(data['teams']);
      data = accountNullImageAndRegion(data);
      //Parsing the data to be a List of "team" which is a map
      team = data;
    } catch (e) {
      print('Failed to get team data: $e');
    }
  }
}

class SingleTeamPlayers {
  Map? teamPlayers;
  String? teamID;
  SingleTeamPlayers();
  Future<void> getSingleTeamPlayers(String teamID) async {
    try {
      Map data;
      Uri test = Uri(
          scheme: 'https',
          host: 'zsr.octane.gg',
          path: '/stats/players/teams',
          queryParameters: {'team': teamID});
      Response response = await get(test);
      data = jsonDecode(response.body);
      log(data.toString());
      data = accountNullImageAndRegion(data);
      teamPlayers = data;
    } catch (e) {
      print('Failed to get team data: $e');
    }
  }
}

class SingleTeam extends SingleTeamData {
  String teamName;
  String region;
  String imgUrl;
  SingleTeam(this.teamName, this.region, this.imgUrl);
}
