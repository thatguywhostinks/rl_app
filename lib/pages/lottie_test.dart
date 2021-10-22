import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieTest extends StatelessWidget {
  const LottieTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [Lottie.asset('assets/lottie/14202-wheel-loading.json')],
        ),
      ),
    );
  }
}
