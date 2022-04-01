import 'package:customer_web/widgets/intro_row/bloc/intro_widgets_loaded_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rive/rive.dart';

class SpaceStationBody extends StatelessWidget {

  const SpaceStationBody({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size(context: context),
      width: _size(context: context),
      child: RiveAnimation.asset(
        'rive/main_rive.riv',
        artboard: 'space_station',
        animations: const ['ufos'],
        fit: BoxFit.contain,
        onInit: (_) => BlocProvider.of<IntroWidgetsLoadedBloc>(context).add(SpaceStationLoaded()),
      )
    );
  }

  double _size({required BuildContext context}) {
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