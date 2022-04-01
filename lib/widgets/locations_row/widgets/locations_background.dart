import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class LocationsBackground extends StatelessWidget {

  const LocationsBackground({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _spacer(context: context, scale: .38),
        const Divider(thickness: 2),
        _spacer(context: context, scale: .01),
        const Divider(thickness: 2),
        _spacer(context: context, scale: .04),
        const Divider(thickness: 2),
        _spacer(context: context, scale: .115),
        const Divider(thickness: 2),
        _spacer(context: context, scale: .245),
        const Divider(thickness: 2),
      ],
    );
  }

  Widget _spacer({required BuildContext context, required double scale}) {
    final double height = MediaQuery.of(context).size.width * (2/3);
    return SizedBox(height: height.h * (scale * _adjuster(context: context)));
  }

  double _adjuster({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return .75;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return .85;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return .93;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return .98;
    }
    return 1;
  }
}