import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'cubit/intro_logo_loaded_cubit.dart';

class IntroLogo extends StatefulWidget {

  @override
  State<IntroLogo> createState() => _IntroLogoState();
}

class _IntroLogoState extends State<IntroLogo> {
  late final Timer _timer;
  
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _timer = Timer(
        const Duration(seconds: 1),
        () => context.read<IntroLogoLoadedCubit>().loaded()
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroLogoLoadedCubit, bool>(
      builder: (context, introLogoLoaded) {
        return AnimatedOpacity(
          opacity: introLogoLoaded ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: introLogoLoaded ? _size(context: context) : .1.sw,
            child: const Image(
              image: AssetImage('logo.png'),
              fit: BoxFit.contain,
            )
          ),
        );
      }
    );
  }

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }
  
  double _size({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return .6.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return .4.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return .28.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return .25.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return .25.sw;
    }
    return .2.sw;
  }
}