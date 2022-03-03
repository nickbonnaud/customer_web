import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'cubit/text_loaded_cubit.dart';

class CallToActionText extends StatefulWidget {

  @override
  State<CallToActionText> createState() => _CallToActionTextState();
}

class _CallToActionTextState extends State<CallToActionText> {
  late final Timer _timer;
  
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _timer = Timer(
        const Duration(seconds: 1),
        () => context.read<TextLoadedCubit>().loaded()
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextLoadedCubit, bool>(
      builder: (context, textLoaded) {
        return AnimatedOpacity(
          opacity: textLoaded ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: Text(
            "The fastest and safest way to pay",
            style: TextStyle(
              color: Colors.white,
              fontSize: _titleTextSize(context: context)
            ),
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