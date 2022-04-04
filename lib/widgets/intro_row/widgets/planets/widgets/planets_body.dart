import 'package:customer_web/body/intro_widgets_loaded_bloc/intro_widgets_loaded_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:rive/rive.dart';

class PlanetsBody extends StatelessWidget {

  const PlanetsBody({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size(context: context),
      width: _size(context: context),
      child: RiveAnimation.asset(
        'rive/earth_moon.riv',
        artboard: 'earth_moon',
        animations: const ['moon_orbit'],
        fit: BoxFit.contain,
        onInit: (_) => BlocProvider.of<IntroWidgetsLoadedBloc>(context).add(PlanetsLoaded()),
      )
    );
  }

  double _size({required BuildContext context}) {
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