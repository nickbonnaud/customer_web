import 'package:flutter/material.dart';
import 'package:customer_web/themes/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'planetarium.dart';
import 'quick_sheet_download/quick_sheet_download.dart';

class SmallFormatQuickSheet extends StatelessWidget {
  final String _titleText;
  final String _bodyText;

  const SmallFormatQuickSheet({required String titleText, required String bodyText, Key? key})
    : _titleText = titleText,
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
                const Planetarium(),
                _downloadActionLarge(context: context)
              ],
            ),
          ),
          SizedBox(height: 20.h),
          _downloadActionSmall(context: context),
          SizedBox(height: 20.h),
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
    return 36.sp;
  }

  Widget _downloadActionLarge({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return Container();
    }
    return Positioned(
      top: 20.h,
      right: 20.w,
      child: SizedBox(
        width: _downloadWidth(context: context),
        child: const QuickSheetDownload(),
      ),
    );
  }

  double _downloadWidth({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return .55.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return .45.sw;
    }
    return .35.sw;
  }

  Widget _downloadActionSmall({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return SizedBox(
        width: _downloadWidth(context: context),
        child: const QuickSheetDownload(),
      );
    }
    return Container();
  }
}