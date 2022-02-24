import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/space_station_loaded_cubit.dart';
import 'widgets/space_station_body.dart';

class SpaceStation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40.h,
      left: -25.w,
      child: BlocProvider<SpaceStationLoadedCubit>(
        create: (_) => SpaceStationLoadedCubit(),
        child: SpaceStationBody(),
      )
    );
  }
}