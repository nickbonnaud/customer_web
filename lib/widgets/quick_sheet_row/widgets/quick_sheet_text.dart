import 'package:flutter/material.dart';
import 'package:customer_web/themes/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class QuickSheetText extends StatelessWidget {
  final String _titleText;
  final String _bodyText;

  const QuickSheetText({required String titleText, required String bodyText, Key? key})
    : _titleText = titleText,
      _bodyText = bodyText,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _title(context: context),
        _divider(context: context),
        _body(context: context)
      ],
    );
  }

  Widget _title({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return Container();
    }
    return Text(
      _titleText,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.callToAction,
        fontSize: _titleTextSize(context: context)
      ),
    );
  }

  Widget _divider({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return Container();
    }
    return SizedBox(height: 20.h);
  }

  Widget _body({required BuildContext context}) {
    return Text(
      _bodyText,
      style: TextStyle(
        fontSize: _bodyTextSize(context: context)
      ),
      textAlign: ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')
        ? TextAlign.center
        : TextAlign.start
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
      return 30.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan("LARGE_DESKTOP")) {
      return 32.sp;
    }
    return 28.sp;
  }
}