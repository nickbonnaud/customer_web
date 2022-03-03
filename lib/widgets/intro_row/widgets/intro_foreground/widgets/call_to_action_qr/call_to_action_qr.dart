import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'package:customer_web/themes/global_colors.dart';

import 'cubit/qr_code_loaded_cubit.dart';

class CallToActionQR extends StatefulWidget {

  @override
  State<CallToActionQR> createState() => _CallToActionQRState();
}

class _CallToActionQRState extends State<CallToActionQR> {
  late final Timer _timer;
  
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _timer = Timer(
        const Duration(seconds: 1),
        () => context.read<QrCodeLoadedCubit>().loaded()
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return _downLoadAction(context: context);
  }

  Widget _downLoadAction({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return _mediumScreen(context: context);
    }
    return _largeScreen(context: context);
  }

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _mediumScreen({required BuildContext context}) {
    return BlocBuilder<QrCodeLoadedCubit, bool>(
      builder: (context, qrCodeLoaded) {
        return AnimatedOpacity(
          opacity: qrCodeLoaded ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: qrCodeLoaded ? _qrCodeSize(context: context) : 10.w,
            width: qrCodeLoaded ? _qrCodeSize(context: context) : 10.w,
            child: const Image(
              image: AssetImage('qr_code.png'),
              fit: BoxFit.contain,
            ),
          ),
        );
      }
    );
  }
  
  Widget _largeScreen({required BuildContext context}) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: BlocBuilder<QrCodeLoadedCubit, bool>(
            builder: (context, qrCodeLoaded) {
              return AnimatedOpacity(
                opacity: qrCodeLoaded ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: Text(
                  "Scan to download",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.callToAction,
                    fontSize: _qrTextSize(context: context)
                  ),
                ),
              );
            }
          )
        ),
        BlocBuilder<QrCodeLoadedCubit, bool>(
          builder: (context, qrCodeLoaded) {
            return AnimatedOpacity(
              opacity: qrCodeLoaded ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: qrCodeLoaded ? _qrCodeSize(context: context) : 10.w,
                width: qrCodeLoaded ? _qrCodeSize(context: context) : 10.w,
                child: const Image(
                  image: AssetImage('qr_code.png'),
                  fit: BoxFit.contain,
                ),
              ),
            );
          }
        )
      ],
    );
  }

  double _qrTextSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return 40.sp;
    }
    return 35.sp;
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