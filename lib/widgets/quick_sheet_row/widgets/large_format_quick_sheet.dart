import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'planetarium.dart';
import 'quick_sheet_download/quick_sheet_download.dart';
import 'quick_sheet_text.dart';

class LargeFormatQuickSheet extends StatelessWidget {
  final String _titleText;
  final String _bodyText;

  const LargeFormatQuickSheet({required String titleText, required String bodyText})
    : _titleText = titleText,
      _bodyText = bodyText;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * (2/3),
      color: const Color.fromRGBO(248, 246, 246, 100),
      child: Stack(
        children: [
          Planetarium(),
          _text(context: context),
          _downloadAction(context: context)
        ],
      ),
    );
  }

  Widget _text({required BuildContext context}) {
    return Positioned(
      top: 20.h,
      left: 20.w,
      child: SizedBox(
        width: _width(context: context),
        child: QuickSheetText(titleText: _titleText, bodyText: _bodyText),
      ),
    );
  }

  double _width({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return .3.sw;
    }
    return .35.sw;
  }

  Widget _downloadAction({required BuildContext context}) {
    return Positioned(
      top: 20.h,
      right: 20.w,
      child: SizedBox(
        width: .35.sw,
        child: QuickSheetDownload(),
      ),
    );
  }
}