import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class CallToActionText extends StatelessWidget {

  const CallToActionText({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      "The fastest and safest way to pay",
      style: TextStyle(
        color: Colors.white,
        fontSize: _titleTextSize(context: context)
      ),
    );
  }

  double _titleTextSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 65.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return 55.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return 40.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 55.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return 60.sp;
    }
    return 50.sp;
  }
}