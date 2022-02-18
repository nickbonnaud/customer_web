import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Background extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
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
      height: MediaQuery.of(context).size.height,
      child: RiveAnimation.asset(
        'rive/header.riv',
        artboard: 'background',
        controllers: [_riveAnimationController],
        fit: BoxFit.cover,
      ),
    );
  }
}