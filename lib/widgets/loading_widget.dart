
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset('assets/lottie/4847-wheel-loading-animation.gif'),
      constraints: BoxConstraints(maxHeight: 20.0, maxWidth: 50.0),
    );
  }
}