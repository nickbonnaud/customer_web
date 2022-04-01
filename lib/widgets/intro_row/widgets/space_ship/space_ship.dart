import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/space_ship_body.dart';

class SpaceShip extends StatelessWidget {

  const SpaceShip({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: _height(context: context),
      right: _right(context: context),
      child: const SpaceShipBody()
    );
  }

  double _height({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return 200.h;
    }
    return 5.h;
  }

  double _right({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return -100.w;
    }
    return -50.w;
  }
}