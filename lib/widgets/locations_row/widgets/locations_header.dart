import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:customer_web/themes/global_colors.dart';

class LocationsHeader extends StatelessWidget {
  static const String _body = "Use at all your favorite businesses. Nova Pay is compatible with most payment systems.";

  const LocationsHeader({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topSpacer(context: context),
        _titleText(context: context),
        SizedBox(height: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? 5.h : 20.h),
        _bodyText(context: context)
      ],
    );
  }

  Widget _topSpacer({required BuildContext context}) {
    return ResponsiveWrapper.of(context).isSmallerThan(TABLET)
      ? SizedBox(height: 20.h)
      : Container();
  }

  Widget _titleText({required BuildContext context}) {
    return Text(
      "Nova Pay Anywhere",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.callToAction,
        fontSize: _titleTextSize(context: context)
      ),
    );
  }

  Widget _bodyText({required BuildContext context}) {
    return ResponsiveWrapper.of(context).isSmallerThan(TABLET)
      ? _smallBodyText(context: context)
      : _largeBodyText(context: context);
  }

  Widget _smallBodyText({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        _body,
        style: TextStyle(
          fontSize: _bodyTextSize(context: context)
        ),
        textAlign: TextAlign.center
      ),
    );
  }

  Widget _largeBodyText({required BuildContext context}) {
    return Text(
      _body,
      style: TextStyle(
        fontSize: _bodyTextSize(context: context)
      ),
      textAlign: TextAlign.start
    );
  }

  double _titleTextSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 75.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return 60.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return 45.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 40.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan("LARGE_DESKTOP")) {
      return 36.sp;
    }
    return 32.sp;
  }

  double _bodyTextSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 56.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return 46.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return 40.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 36.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan("LARGE_DESKTOP")) {
      return 32.sp;
    }
    return 28.sp;
  }
}