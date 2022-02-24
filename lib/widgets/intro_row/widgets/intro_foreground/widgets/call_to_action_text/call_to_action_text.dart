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

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        context.read<TextLoadedCubit>().loaded();
      });
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

  double _titleTextSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return 60.sp;
    }
    return 50.sp;
  }
}