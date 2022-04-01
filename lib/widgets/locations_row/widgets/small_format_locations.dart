import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:customer_web/themes/global_colors.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'locations_background.dart';
import 'pedestals/pedestals.dart';

class SmallFormatLocations extends StatelessWidget {
  final GlobalKey _mainScrollKey;
  final String _titleText;
  final String _bodyText;

  const SmallFormatLocations({
    required GlobalKey mainScrollKey,
    required String titleText,
    required String bodyText,
    Key? key
  })
    : _mainScrollKey = mainScrollKey,
      _titleText = titleText,
      _bodyText = bodyText,
      super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(248, 246, 246, 100),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            _titleText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.callToAction,
              fontSize: _titleTextSize(context: context)
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              _bodyText,
              style: TextStyle(
                fontSize: _bodyTextSize(context: context)
              ),
              textAlign: TextAlign.center
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * (2/3),
            child: Stack(
              children: [
                const LocationsBackground(),
                Pedestals(mainScrollKey: _mainScrollKey)
              ],
            ),
          )
        ],
      ),
    );
  }
  
  double _titleTextSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 75.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return 60.sp;
    }
    return 45.sp;
  }

  double _bodyTextSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 56.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return 46.sp;
    }
    return 40.sp;
  }
}