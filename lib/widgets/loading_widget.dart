
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network('https://giphy.com/gifs/congratulations-congrats-xT0xezQGU5xCDJuCPe'),
      constraints: BoxConstraints(maxHeight: 20.0, maxWidth: 50.0),
    );
  }
}