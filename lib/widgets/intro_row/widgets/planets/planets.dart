import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/planets_body.dart';

class Planets extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _height(context: context),
      left: 0,
      child: PlanetsBody()
    );
  }

  double _height({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return -25.h;
    }
    return -50.h;
  }
}