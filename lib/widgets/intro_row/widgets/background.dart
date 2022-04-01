import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Background extends StatelessWidget {

  const Background({Key? key})
    : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const RiveAnimation.asset(
        'rive/background.riv',
        artboard: 'background',
        animations: ['main'],
        fit: BoxFit.cover,
      ),
    );
  }
}