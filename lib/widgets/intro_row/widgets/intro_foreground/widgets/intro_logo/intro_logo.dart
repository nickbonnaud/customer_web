import 'package:customer_web/body/intro_widgets_loaded_bloc/intro_widgets_loaded_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:transparent_image/transparent_image.dart';

class IntroLogo extends StatefulWidget {

  const IntroLogo({Key? key})
    : super(key: key);

  @override
  State<IntroLogo> createState() => _IntroLogoState();
}

class _IntroLogoState extends State<IntroLogo> {
  final FadeInImage _image = FadeInImage.memoryNetwork(
    placeholder: kTransparentImage,
    image: '/assets/logo.png',
    fit: BoxFit.contain
  );
  
  @override
  void initState() {
    super.initState();
    _image.image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((_, __) {
      if (mounted) {
        BlocProvider.of<IntroWidgetsLoadedBloc>(context).add(LogoLoaded());
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size(context: context),
      child: _image
    );
  }
  
  double _size({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return .6.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return .4.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return .28.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return .25.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_DESKTOP')) {
      return .25.sw;
    }
    return .2.sw;
  }
}