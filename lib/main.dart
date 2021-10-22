// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rl_app/pages/loading.dart';
import 'package:rl_app/pages/fav_team_select.dart';
import 'package:rl_app/pages/home.dart';
import 'package:rl_app/pages/lottie_test.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/lottie_test': (context) => LottieTest(),
      '/fav_team_select': (context) => FavTeamSelect(),
    }));
