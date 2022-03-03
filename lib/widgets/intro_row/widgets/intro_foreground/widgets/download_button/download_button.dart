import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:customer_web/themes/global_colors.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'cubit/download_button_loaded_cubit.dart';

class DownloadButton extends StatefulWidget {

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  late final Timer _timer;
  
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _timer = Timer(
        const Duration(seconds: 1), 
        () => context.read<DownloadButtonLoadedCubit>().loaded()
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadButtonLoadedCubit, bool>(
      builder: (context, downloadButtonLoaded) {
        return AnimatedOpacity(
          opacity: downloadButtonLoaded ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: downloadButtonLoaded ? _buttonWidth() : 1.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.h)
              ),
              onPressed: () => _downloadButtonPressed(),
              child: Column(
                children: [
                  AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontSize: downloadButtonLoaded ? _fontSize() : 1.sp,
                      color: Theme.of(context).colorScheme.onCallToAction,
                      fontWeight: FontWeight.w800
                    ),
                    duration: const Duration(seconds: 1),
                    child: const Text("Download"),
                  ),
                  AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontSize: downloadButtonLoaded ? _fontSize() : 1.sp,
                      color: Theme.of(context).colorScheme.onCallToAction,
                      fontWeight: FontWeight.w800
                    ),
                    duration: const Duration(seconds: 1),
                    child: const Text("Nova Pay"),
                  ),
                ],
              )
            )
          ),
        );
      }
    );
  }

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }

  double _buttonWidth() {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 500.w;
    }
    return 400.w;
  }
  
  double _fontSize() {
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