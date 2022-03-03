import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rive/rive.dart';

import '../cubit/space_station_loaded_cubit.dart';

class SpaceStationBody extends StatefulWidget {

  @override
  State<SpaceStationBody> createState() => _SpaceStationBodyState();
}

class _SpaceStationBodyState extends State<SpaceStationBody> {
  late final RiveAnimationController _riveAnimationController;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    _riveAnimationController = OneShotAnimation('ufos');

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _timer = Timer(
        const Duration(seconds: 1),
        () => context.read<SpaceStationLoadedCubit>().loaded()
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpaceStationLoadedCubit, bool>(
      builder: (context, spaceStationLoaded) {
        return AnimatedOpacity(
          opacity: spaceStationLoaded ? 1 : 0, 
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            height: spaceStationLoaded ? _size() : .1.sw,
            width: spaceStationLoaded ? _size() : .1.sw,
            duration: const Duration(seconds: 1),
            child: RiveAnimation.asset(
              'rive/header.riv',
              artboard: 'space_station',
              controllers: [_riveAnimationController],
              fit: BoxFit.contain,
            )
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _riveAnimationController.dispose();
    super.dispose();
  }

  double _size() {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return .65.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return .5.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return .4.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return .35.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return .37.sw;
    }
    return .27.sw;
  }
}