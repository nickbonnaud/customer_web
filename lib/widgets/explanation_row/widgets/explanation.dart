import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/resources/visibility_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../bloc/explanation_bloc.dart';

class Explanation extends StatefulWidget {
  final String _text;
  final String _animationPath;
  final GlobalKey _mainScrollKey;

  const Explanation({
    required String text,
    required String animationPath,
    required GlobalKey mainScrollKey
  })
    : _text = text,
      _animationPath = animationPath,
      _mainScrollKey = mainScrollKey;

  @override
  State<Explanation> createState() => _ExplanationState();
}

class _ExplanationState extends State<Explanation> with SingleTickerProviderStateMixin {
  final double _enterAnimationHeight = .4.sh;
  final GlobalKey _iconKey = GlobalKey();

  late AnimationController _iconController;
  late VisibilityFinder _visibilityFinder;
  
  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _visibilityFinder = VisibilityFinder(parentKey: widget._mainScrollKey, childKey: _iconKey, enterAnimationMinHeight: _enterAnimationHeight);
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<ScrollWatcherCubit, double>(
      listenWhen: ((previousOffset, currentOffset) => previousOffset != currentOffset),
      listener: (context, absoluteOffset) {
        _didEnterView();
      },
      child: Column(
        crossAxisAlignment: ResponsiveWrapper.of(context).isLargerThan(TABLET)
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
        children: [
          Align(child: _icon()),
          SizedBox(height: 10.h),
          _text()
        ],
      ),
    );
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  Widget _icon() {
    return MouseRegion(
      onEnter: (_) => _playAnimation(),
      child: Lottie.asset(
        widget._animationPath,
        key: _iconKey,
        controller: _iconController,
        width: _iconDimensions(),
        height: _iconDimensions()
      ),
    );
  }

  Widget _text() {
    return Text(
      widget._text,
      style: TextStyle(
        fontSize: _fontSize()
      ),
    );
  }

  double _iconDimensions() {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return .3.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return .25.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return .2.sw;
    }
    return .15.sw;
  }

  double _fontSize() {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 45.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return 40.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return 35.sp;
    }
    return 25.sp;
  }

  void _playAnimation() {
    if (_iconController.isAnimating) return;
    _iconController.forward().then((_) => _iconController.reset());
  }

  void _didEnterView() {
    if (_iconController.status != AnimationStatus.dismissed || BlocProvider.of<ExplanationBloc>(context).animationPlayed(animation: widget._animationPath)) return;

    bool iconVisible = _visibilityFinder.isVisible();

    if (iconVisible) {
      BlocProvider.of<ExplanationBloc>(context).add(AnimationPlayed(animation: widget._animationPath));
      _iconController.forward().then((value) => _iconController.reset());
    }
  }
}