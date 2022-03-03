import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/intro_row_loaded_cubit.dart';
import 'widgets/background.dart';
import 'widgets/intro_foreground/intro_foreground.dart';
import 'widgets/planets/planets.dart';
import 'widgets/space_ship/space_ship.dart';
import 'widgets/space_station/space_station.dart';

class IntroRow extends StatefulWidget {

  @override
  State<IntroRow> createState() => _IntroRowState();
}

class _IntroRowState extends State<IntroRow> {
  late final Timer _timer;
  
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _timer = Timer(
        const Duration(milliseconds: 250),
        () => context.read<IntroRowLoadedCubit>().loaded()
      );
    });
  }
  
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

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}