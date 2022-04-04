import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/locations_background.dart';
import 'widgets/locations_header.dart';
import 'widgets/pedestals/bloc/pedestals_parallax_bloc.dart';
import 'widgets/pedestals/pedestals.dart';

class LocationsRow extends StatelessWidget {
  
  const LocationsRow({Key? key})
    :super(key: key);

    @override
  Widget build(BuildContext context) {
    return BlocProvider<PedestalsParallaxBloc>(
      create: (_) => PedestalsParallaxBloc(),
      child: Container(
        color: const Color.fromRGBO(248, 246, 246, 100),
        child: Column(
          children: _header(context: context)..add(_pedestalsScene(context: context)),
        ),
      )
    );
  }

  List<Widget> _header({required BuildContext context}) {
    return ResponsiveWrapper.of(context).isSmallerThan(TABLET)
      ? [const LocationsHeader()]
      : [];
  }

  Widget _pedestalsScene({required BuildContext context}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * (2/3),
      child: Stack(
        children: [
          const LocationsBackground(),
          _largeText(context: context),
          const Pedestals()
        ],
      ),
    );
  }

  Widget _largeText({required BuildContext context}) {
    return ResponsiveWrapper.of(context).isSmallerThan(TABLET)
      ? Container()
      : Positioned(
          top: 20.h,
          left: 20.w,
          child: SizedBox(
            width: _width(context: context),
            child: const LocationsHeader(),
          ),
        );
  }

  double _width({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return .55.sw;
    }
    return .6.sw;
  }
}