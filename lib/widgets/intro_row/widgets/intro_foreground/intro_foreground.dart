import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/call_to_action_qr/call_to_action_qr.dart';
import 'widgets/call_to_action_text/call_to_action_text.dart';
import 'widgets/download_button/download_button.dart';
import 'widgets/intro_logo/intro_logo.dart';
import 'widgets/phone_image/phone_image.dart';


class IntroForeground extends StatelessWidget {

  const IntroForeground({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: _body(context: context)
    );
  }

  Widget _body({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return _smallScreenBody();
    }
    return _largeScreenBody(context: context);
  }

  Widget _smallScreenBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const IntroLogo(),
        SizedBox(height: 10.h),
        const CallToActionText(),
        SizedBox(height: 30.h),
        const PhoneImage(),
        SizedBox(height: 30.h),
        const DownloadButton()
      ],
    );
  }

  Widget _largeScreenBody({required BuildContext context}) {
    return Row(
      children: [
        SizedBox(width: .22.sw),
        const PhoneImage(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const IntroLogo(),
                SizedBox(height: 10.h),
                const CallToActionText(),
                SizedBox(height: _callToActionSpacer(context: context)),
                const CallToActionQR(),
                SizedBox(height: 150.h,)
              ],
            ),
          )
        )
      ],
    );
  }

  double _callToActionSpacer({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 50.h;
    }
    return 10.h;
  }
}