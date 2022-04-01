import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'widgets/download_button.dart';
import 'widgets/qr_code.dart';

class QuickSheetDownload extends StatelessWidget {

  const QuickSheetDownload({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return const DownloadButton();
    }
    return const QrCode();
  }
}