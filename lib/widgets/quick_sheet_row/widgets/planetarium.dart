import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Planetarium extends StatefulWidget {

  @override
  State<Planetarium> createState() => _PlanetariumState();
}

class _PlanetariumState extends State<Planetarium> {
  late RiveAnimationController _riveAnimationController;

  @override
  void initState() {
    super.initState();
    _riveAnimationController = OneShotAnimation('main');
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * (2/3),
      child: RiveAnimation.asset(
        'rive/main_rive.riv',
        artboard: 'planetarium',
        controllers: [_riveAnimationController],
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  void dispose() {
    _riveAnimationController.dispose();
    super.dispose();
  }
}