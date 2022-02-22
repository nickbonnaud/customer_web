import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/page_loaded_cubit.dart';
import 'widgets/space_station_body.dart';

class SpaceStation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100.h,
      left: 100.w,
      child: BlocProvider<PageLoadedCubit>(
        create: (_) => PageLoadedCubit(),
        child: SpaceStationBody(),
      )
    );
  }
}