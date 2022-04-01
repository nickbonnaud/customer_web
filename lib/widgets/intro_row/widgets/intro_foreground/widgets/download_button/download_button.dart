import 'package:customer_web/themes/global_colors.dart';
import 'package:customer_web/widgets/intro_row/bloc/intro_widgets_loaded_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class DownloadButton extends StatelessWidget {

  const DownloadButton({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<IntroWidgetsLoadedBloc>(context).add(QrCodeLoaded());
    
    return SizedBox(
      width: _buttonWidth(context: context),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15.h)
        ),
        onPressed: () => _downloadButtonPressed(),
        child: Column(
          children: [
            Text(
              "Download",
              style: TextStyle(
                fontSize: _fontSize(context: context),
                color: Theme.of(context).colorScheme.onCallToAction,
                fontWeight: FontWeight.w800
              ),
            ),
            Text(
              "Nova Pay",
              style: TextStyle(
                fontSize: _fontSize(context: context),
                color: Theme.of(context).colorScheme.onCallToAction,
                fontWeight: FontWeight.w800
              ),
            )
          ],
        )
      )
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