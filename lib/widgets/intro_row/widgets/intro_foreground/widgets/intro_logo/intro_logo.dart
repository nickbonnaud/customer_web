import 'package:customer_web/widgets/intro_row/cubit/intro_row_loaded_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class IntroLogo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroRowLoadedCubit, bool>(
      builder: (context, introLoaded) {
        return AnimatedOpacity(
          opacity: introLoaded ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: introLoaded ? _size(context: context) : .1.sw,
            child: const Image(
              image: AssetImage('logo.png'),
              fit: BoxFit.contain,
            )
          ),
        );
      }
    );
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