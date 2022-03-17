import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../bloc/how_to_bloc.dart';

class HowToImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _imageHeight(context: context),
      child: BlocBuilder<HowToBloc, HowToState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            child: Image(
              image: AssetImage(HowToBloc.imageAssets[state.switcherIndex % HowToBloc.imageAssets.length]),
              fit: BoxFit.contain,
              key: UniqueKey(),
            ),
          );
        }
      ),
    );
  }

  double _imageHeight({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return .6.sh;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return .45.sh;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return .6.sh;
    }
    return .8.sh;
  }
}