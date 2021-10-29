// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rl_app/pages/loading.dart';
import 'package:rl_app/pages/fav_team_select.dart';
import 'package:rl_app/pages/home.dart';
import 'package:rl_app/pages/event_schedule.dart';
import 'package:rl_app/pages/drop_down_test.dart';
import 'package:rl_app/pages/event_schedule_filter.dart';
import 'package:rl_app/services/get_events.dart';

void main() => runApp(MaterialApp(initialRoute: '/event_schedule_filter', routes: {
  '/': (context) => Loading(),
  '/home': (context) => Home(),
  '/fav_team_select': (context) => FavTeamSelect(),
  '/event_schedule': (context) => EventSchedule(),
  '/event_schedule_filter': (context) => EventScheduleFilter(),
  '/dropdowntest': (context) => DropDownTest(),
}));
