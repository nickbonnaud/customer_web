import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class QrCode extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _qrCodeSize(context: context),
      width: _qrCodeSize(context: context),
      child: const Image(
        image: AssetImage('qr_code.png'),
        fit: BoxFit.contain,
      )
    );
  }

  double _qrCodeSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return 200.w;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 180.w;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return 140.w;
    }
    return 100.w;
  }
}