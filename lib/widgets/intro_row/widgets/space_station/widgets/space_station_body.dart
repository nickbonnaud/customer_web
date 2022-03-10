import 'package:customer_web/widgets/intro_row/cubit/intro_row_loaded_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rive/rive.dart';

class SpaceStationBody extends StatefulWidget {

  @override
  State<SpaceStationBody> createState() => _SpaceStationBodyState();
}

class _SpaceStationBodyState extends State<SpaceStationBody> {
  late final RiveAnimationController _riveAnimationController;

  @override
  void initState() {
    super.initState();

    _riveAnimationController = OneShotAnimation('ufos');
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroRowLoadedCubit, bool>(
      builder: (context, introLoaded) {
        return AnimatedOpacity(
          opacity: introLoaded ? 1 : 0, 
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            height: introLoaded ? _size() : .1.sw,
            width: introLoaded ? _size() : .1.sw,
            duration: const Duration(seconds: 1),
            child: RiveAnimation.asset(
              'rive/main_rive.riv',
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