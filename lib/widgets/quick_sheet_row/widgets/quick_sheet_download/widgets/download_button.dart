import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:customer_web/themes/global_colors.dart';

class DownloadButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10.h)
      ),
      onPressed: () => _downloadButtonPressed(),
      child: Text(
        "Get now",
        style: TextStyle(
          fontSize: _fontSize(context: context),
          color: Theme.of(context).colorScheme.onCallToAction,
          fontWeight: FontWeight.w800
        ),
      )
    );
  }
  
  double _fontSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 56.sp;
    }
    return 42.sp;
  }

  void _downloadButtonPressed() {
    // TODO
    // connect download button
  }
}