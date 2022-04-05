import 'package:customer_web/body/intro_widgets_loaded_bloc/intro_widgets_loaded_bloc.dart';
import 'package:customer_web/themes/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:transparent_image/transparent_image.dart';

class CallToActionQR extends StatefulWidget {

  const CallToActionQR({Key? key})
    : super(key: key);
  
  @override
  State<CallToActionQR> createState() => _CallToActionQRState();
}

class _CallToActionQRState extends State<CallToActionQR> {
  final FadeInImage _image = FadeInImage.memoryNetwork(
    placeholder: kTransparentImage,
    image: '/assets/qr_code.png',
    fit: BoxFit.contain
  );
  
  @override
  void initState() {
    super.initState();
    _image.image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((_, __) {
      if (mounted) {
        BlocProvider.of<IntroWidgetsLoadedBloc>(context).add(QrCodeLoaded());
      }
    }));
  }
  
  @override
  Widget build(BuildContext context) {
    return _downLoadAction(context: context);
  }

  Widget _downLoadAction({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return _mediumScreen(context: context);
    }
    return _largeScreen(context: context);
  }

  Widget _mediumScreen({required BuildContext context}) {
    return SizedBox(
      height: _qrCodeSize(context: context),
      width: _qrCodeSize(context: context),
      child: _image,
    );
  }
  
  Widget _largeScreen({required BuildContext context}) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Text(
            "Scan to download",
            style: TextStyle(
              color: Theme.of(context).colorScheme.callToAction,
              fontSize: _qrTextSize(context: context)
            ),
          ),
        ),
        SizedBox(
          height: _qrCodeSize(context: context),
          width: _qrCodeSize(context: context),
          child: _image,
        )
      ],
    );
  }

  double _qrTextSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return 40.sp;
    }
    return 35.sp;
  }

  double _qrCodeSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return 200.w;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 180.w;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return 140.w;
    }
    return 100.w;
  }
}