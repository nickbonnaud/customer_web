import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:rive/rive.dart';

import '../cubit/space_ship_loaded_cubit.dart';

class SpaceShipBody extends StatefulWidget {

  @override
  State<SpaceShipBody> createState() => _SpaceShipBodyState();
}

class _SpaceShipBodyState extends State<SpaceShipBody> {
  late final RiveAnimationController _riveAnimationController;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    _riveAnimationController = OneShotAnimation('flame');

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _timer = Timer(
        const Duration(seconds: 1),
        () => context.read<SpaceShipLoadedCubit>().loaded()
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpaceShipLoadedCubit, bool>(
      builder: (context, spaceShipLoaded) {
        return AnimatedOpacity(
          opacity: spaceShipLoaded ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            height: spaceShipLoaded ? _size() : .1.sw,
            width: spaceShipLoaded ? _size() : .1.sw,
            duration: const Duration(seconds: 1),
            child: Transform.rotate(
              angle: math.pi / 4,
              child: RiveAnimation.asset(
                'rive/header.riv',
                artboard: 'rocket',
                controllers: [_riveAnimationController],
                fit: BoxFit.contain,
              ),
            ),
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
      return .6.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return .45.sw;
    } else  if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return .35.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return .32.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return .35.sw;
    }
    return .25.sw;
  }
}