import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:rive/rive.dart';

import '../cubit/planets_loaded_cubit.dart';

class PlanetsBody extends StatefulWidget {

  @override
  State<PlanetsBody> createState() => _PlanetsBodyState();
}

class _PlanetsBodyState extends State<PlanetsBody> {
  late final RiveAnimationController _riveAnimationController;

  @override
  void initState() {
    super.initState();

    _riveAnimationController = OneShotAnimation('moon_orbit');

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        context.read<PlanetsLoadedCubit>().loaded();
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanetsLoadedCubit, bool>(
      builder: (context, planetsLoaded) {
        return AnimatedOpacity(
          opacity: planetsLoaded ? 1 : 0, 
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            height: planetsLoaded ? _size() : .1.sw,
            width: planetsLoaded ? _size() : .1.sw,
            duration: const Duration(seconds: 1),
            child: RiveAnimation.asset(
              'rive/header.riv',
              artboard: 'earth_moon',
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
    _riveAnimationController.dispose();
    super.dispose();
  }

  double _size() {
    if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return .28.sw;
    }
    return .25.sw;
  }
}