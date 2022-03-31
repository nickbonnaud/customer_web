import 'dart:math' as math;

import 'package:customer_web/widgets/intro_row/bloc/intro_widgets_loaded_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:rive/rive.dart';

class SpaceShipBody extends StatefulWidget {

  @override
  State<SpaceShipBody> createState() => _SpaceShipBodyState();
}

class _SpaceShipBodyState extends State<SpaceShipBody> {
  late final RiveAnimationController _riveAnimationController;

  @override
  void initState() {
    super.initState();

    _riveAnimationController = OneShotAnimation(
      'flame',
      onStart: () => BlocProvider.of<IntroWidgetsLoadedBloc>(context).add(SpaceShipLoaded()),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size(),
      width: _size(),
      child: Transform.rotate(
        angle: math.pi / 4,
        child: RiveAnimation.asset(
          'rive/main_rive.riv',
          artboard: 'rocket',
          controllers: [_riveAnimationController],
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  void dispose() {
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