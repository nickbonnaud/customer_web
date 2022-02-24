import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/space_ship_loaded_cubit.dart';
import 'widgets/space_ship_body.dart';

class SpaceShip extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5.h,
      right: -50.w,
      child: BlocProvider<SpaceShipLoadedCubit>(
        create: (_) => SpaceShipLoadedCubit(),
        child: SpaceShipBody(),
      )
    );
  }
}