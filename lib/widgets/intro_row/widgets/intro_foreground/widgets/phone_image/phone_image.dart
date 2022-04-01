import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/cubit/image_switcher_cubit.dart';
import 'widgets/image_switcher.dart';

class PhoneImage extends StatefulWidget {

  const PhoneImage({Key? key})
    : super(key: key);

  @override
  State<PhoneImage> createState() => _PhoneImageState();
}

class _PhoneImageState extends State<PhoneImage> with SingleTickerProviderStateMixin {
  final Curve _curve = Curves.easeInOut;
  
  late final AnimationController _animationController;
  late final CurvedAnimation _curvedAnimation;
  late final Animation<Offset> _animationOffset;
  
  
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _curvedAnimation = CurvedAnimation(parent: _animationController, curve: _curve);
    _animationOffset = Tween<Offset>(
      begin: const Offset(0, .05),
      end: const Offset(0, -.05)
    ).animate(_curvedAnimation);

    _animationController.repeat(reverse: true);
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size(),
      child: SlideTransition(
        position: _animationOffset,
        child: BlocProvider<ImageSwitcherCubit>(
          create: (_) => ImageSwitcherCubit(),
          child: const ImageSwitcher(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _curvedAnimation.dispose();
    super.dispose();
  }

  double _size() {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return .6.sh;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return .5.sh;
    }
    return .6.sh;
  }
}