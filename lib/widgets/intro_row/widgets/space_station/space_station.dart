import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/space_station_body.dart';

class SpaceStation extends StatelessWidget {

  const SpaceStation({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40.h,
      left: _left(context: context),
      child: const SpaceStationBody()
    );
  }

  double _left({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return -100.w;
    }
    return -25.w;
  }
}