import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/large_format_quick_sheet.dart';
import 'widgets/small_format_quick_sheet.dart';

class QuickSheetRow extends StatelessWidget {
  static const String _titleText = "At your fingertips";
  static const String _bodyText = "View, request, or pay live bills. Find nearby businesses, see your active locations.";
  
  @override
  Widget build(BuildContext context) {
    if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return const SmallFormatQuickSheet(titleText: _titleText, bodyText: _bodyText);
    }
    return const LargeFormatQuickSheet(titleText: _titleText, bodyText: _bodyText);
  }
}