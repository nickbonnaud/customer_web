import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'cubit/space_station_loaded_cubit.dart';
import 'widgets/space_station_body.dart';

class SpaceStation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40.h,
      left: _left(context: context),
      child: BlocProvider<SpaceStationLoadedCubit>(
        create: (_) => SpaceStationLoadedCubit(),
        child: SpaceStationBody(),
      )
    );
  }

  double _left({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return -100.w;
    }
    return -25.w;
  }
}