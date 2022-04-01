import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'widgets/download_button.dart';
import 'widgets/qr_code.dart';

class DownloadAction extends StatelessWidget {

  const DownloadAction({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')
      ? const DownloadButton()
      : const QrCode();
  }
}