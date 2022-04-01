import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Planetarium extends StatelessWidget {

  const Planetarium({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * (2/3),
      child: const RiveAnimation.asset(
        'rive/main_rive.riv',
        artboard: 'planetarium',
        animations: ['main'],
        fit: BoxFit.fitWidth,
      ),
    );
  }
}