import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:customer_web/themes/global_colors.dart';

import 'bloc/how_to_bloc.dart';
import 'widgets/how_to_body.dart';

class HowToRow extends StatelessWidget {
  final GlobalKey _mainScrollKey;

  const HowToRow({required GlobalKey mainScrollKey, Key? key})
    : _mainScrollKey = mainScrollKey,
      super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Text(
              "Using Nova Pay",
              style: TextStyle(
                fontSize: _titleFontSize(context: context),
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.callToAction
              ),
            ),
            SizedBox(height: 40.h),
            BlocProvider<HowToBloc>(
              create: (_) => HowToBloc(),
              child: HowToBody(mainScrollKey: _mainScrollKey),
            ),
          ],
        ),
      ),
    );
  }

  double _titleFontSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 95.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return 85.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 75.sp;
    }
    return 65.sp;
  }
}