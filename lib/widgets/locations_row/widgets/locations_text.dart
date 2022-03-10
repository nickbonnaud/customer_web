import 'package:flutter/material.dart';
import 'package:customer_web/themes/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class LocationsText extends StatelessWidget {
  final String _titleText;
  final String _bodyText;

  const LocationsText({required String titleText, required String bodyText})
    : _titleText = titleText,
      _bodyText = bodyText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _titleText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.callToAction,
            fontSize: _titleTextSize(context: context)
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          _bodyText,
          style: TextStyle(
            fontSize: _bodyTextSize(context: context)
          ),
          textAlign: TextAlign.start
        )
      ],
    );
  }

  double _titleTextSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 40.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan("LARGE_DESKTOP")) {
      return 36.sp;
    }
    return 32.sp;
  }

  double _bodyTextSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 36.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan("LARGE_DESKTOP")) {
      return 32.sp;
    }
    return 28.sp;
  }
}