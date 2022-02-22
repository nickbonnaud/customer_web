import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../cubit/page_loaded_cubit.dart';

class SpaceStationBody extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SpaceStationBodyState();
}

class _SpaceStationBodyState extends State<SpaceStationBody> {
  late RiveAnimationController _riveAnimationController;

  @override
  void initState() {
    super.initState();

    _riveAnimationController = OneShotAnimation('ufos');

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        context.read<PageLoadedCubit>().loaded();
      });
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageLoadedCubit, bool>(
      builder: (context, pageLoaded) {
        return AnimatedOpacity(
          opacity: pageLoaded ? 1 : 0, 
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            color: Colors.transparent,
            height: pageLoaded ? .2.sw : .1.sw,
            width: pageLoaded ? .2.sw : .1.sw,
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
}