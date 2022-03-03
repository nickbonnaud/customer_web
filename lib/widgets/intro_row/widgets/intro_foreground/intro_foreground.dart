import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/call_to_action_qr/call_to_action_qr.dart';
import 'widgets/call_to_action_qr/cubit/qr_code_loaded_cubit.dart';
import 'widgets/call_to_action_text/call_to_action_text.dart';
import 'widgets/call_to_action_text/cubit/text_loaded_cubit.dart';
import 'widgets/download_button/cubit/download_button_loaded_cubit.dart';
import 'widgets/download_button/download_button.dart';
import 'widgets/intro_logo/cubit/intro_logo_loaded_cubit.dart';
import 'widgets/intro_logo/intro_logo.dart';
import 'widgets/phone_image/cubit/phone_image_loaded_cubit.dart';
import 'widgets/phone_image/phone_image.dart';


class IntroForeground extends StatelessWidget {

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
    return _largeScreenBody();
  }

  Widget _smallScreenBody() {
    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocProvider<IntroLogoLoadedCubit>(
          create: (_) => IntroLogoLoadedCubit(),
          child: IntroLogo(),
        ),
        SizedBox(height: 10.h),
        BlocProvider<TextLoadedCubit>(
          create: (_) => TextLoadedCubit(),
          child: CallToActionText(),
        ),
        SizedBox(height: 30.h),
        BlocProvider<PhoneImageLoadedCubit>(
          create: (_) => PhoneImageLoadedCubit(),
          child: PhoneImage(),
        ),
        SizedBox(height: 30.h),
        BlocProvider<DownloadButtonLoadedCubit>(
          create: (_) => DownloadButtonLoadedCubit(),
          child: DownloadButton(),
        )
      ],
    );
  }

  Widget _largeScreenBody() {
    return Row(
      children: [
        SizedBox(width: .22.sw),
        BlocProvider<PhoneImageLoadedCubit>(
          create: (_) => PhoneImageLoadedCubit(),
          child: PhoneImage(),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocProvider<IntroLogoLoadedCubit>(
                  create: (_) => IntroLogoLoadedCubit(),
                  child: IntroLogo(),
                ),
                SizedBox(height: 10.h),
                BlocProvider<TextLoadedCubit>(
                  create: (_) => TextLoadedCubit(),
                  child: CallToActionText(),
                ),
                SizedBox(height: 10.h),
                BlocProvider<QrCodeLoadedCubit>(
                  create: (_) => QrCodeLoadedCubit(),
                  child: CallToActionQR(),
                ),
                SizedBox(height: 150.h,)
              ],
            ),
          )
        )
      ],
    );
  }
}