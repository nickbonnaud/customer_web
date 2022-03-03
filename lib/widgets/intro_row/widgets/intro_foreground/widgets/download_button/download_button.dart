import 'package:customer_web/themes/global_colors.dart';
import 'package:customer_web/widgets/intro_row/cubit/intro_row_loaded_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class DownloadButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroRowLoadedCubit, bool>(
      builder: (context, introLoaded) {
        return AnimatedOpacity(
          opacity: introLoaded ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: introLoaded ? _buttonWidth(context: context) : 1.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.h)
              ),
              onPressed: () => _downloadButtonPressed(),
              child: Column(
                children: [
                  AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontSize: introLoaded ? _fontSize(context: context) : 1.sp,
                      color: Theme.of(context).colorScheme.onCallToAction,
                      fontWeight: FontWeight.w800
                    ),
                    duration: const Duration(seconds: 1),
                    child: const Text("Download"),
                  ),
                  AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontSize: introLoaded ? _fontSize(context: context) : 1.sp,
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

  double _buttonWidth({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 500.w;
    }
    return 400.w;
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