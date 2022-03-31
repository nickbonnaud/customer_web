import 'package:customer_web/widgets/intro_row/bloc/intro_widgets_loaded_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:rive/rive.dart';

class PlanetsBody extends StatefulWidget {

  @override
  State<PlanetsBody> createState() => _PlanetsBodyState();
}

class _PlanetsBodyState extends State<PlanetsBody> {
  late final RiveAnimationController _riveAnimationController;

  @override
  void initState() {
    super.initState();

    _riveAnimationController = OneShotAnimation(
      'moon_orbit',
      onStart: () => BlocProvider.of<IntroWidgetsLoadedBloc>(context).add(PlanetsLoaded()),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size(),
      width: _size(),
      child: RiveAnimation.asset(
        'rive/main_rive.riv',
        artboard: 'earth_moon',
        controllers: [_riveAnimationController],
        fit: BoxFit.contain,
      )
    );
  }

  @override
  void dispose() {
    _riveAnimationController.dispose();
    super.dispose();
  }

  void _animationStarted() {
    print('planets started');
  }

  double _size() {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return .55.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return .36.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return .32.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return .3.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return .28.sw;
    }
    return .25.sw;
  }
}