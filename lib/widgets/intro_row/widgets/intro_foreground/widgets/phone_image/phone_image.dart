import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/phone_image_loaded_cubit.dart';
import 'widgets/cubit/image_switcher_cubit.dart';
import 'widgets/image_switcher.dart';

class PhoneImage extends StatefulWidget {

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
    
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        context.read<PhoneImageLoadedCubit>().loaded();
        _animationController.repeat(reverse: true);
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneImageLoadedCubit, bool>(
      builder: (context, imageLoaded) {
        return AnimatedOpacity(
          opacity: imageLoaded ? 1 : 0, 
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            height: imageLoaded ? .6.sh : .25.sh,
            duration: const Duration(seconds: 1),
            child: SlideTransition(
              position: _animationOffset,
              child: BlocProvider<ImageSwitcherCubit>(
                create: (_) => ImageSwitcherCubit(),
                child: ImageSwitcher(),
              ),
            ),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _curvedAnimation.dispose();
    super.dispose();
  }
}