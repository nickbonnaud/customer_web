import 'package:flutter/material.dart';

import 'widgets/background.dart';
import 'widgets/intro_foreground/intro_foreground.dart';
import 'widgets/planets/planets.dart';
import 'widgets/space_ship/space_ship.dart';
import 'widgets/space_station/space_station.dart';

class IntroRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Background(),
          Planets(),
          SpaceStation(),
          SpaceShip(),
          IntroForeground()
        ],
      ),
    );
  }
}