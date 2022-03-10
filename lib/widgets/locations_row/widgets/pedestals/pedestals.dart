import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/resources/visibility_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:rive/rive.dart';

import 'bloc/pedestals_parallax_bloc.dart';

class Pedestals extends StatefulWidget {
  final GlobalKey _mainScrollKey;

  const Pedestals({required GlobalKey mainScrollKey})
    : _mainScrollKey = mainScrollKey;

  @override
  State<StatefulWidget> createState() => _PedestalsState();
}

class _PedestalsState extends State<Pedestals> {
  static const double _enterMinHeight = 250;
  final GlobalKey _sectionKey = GlobalKey();
  
  late VisibilityFinder _visibilityFinder;
  late RiveAnimationController _riveAnimationController;

  @override
  void initState() {
    super.initState();
    _visibilityFinder = VisibilityFinder(parentKey: widget._mainScrollKey, childKey: _sectionKey, enterAnimationMinHeight: _enterMinHeight);
    _riveAnimationController = OneShotAnimation('pedestals_animation');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScrollWatcherCubit, double>(
      listener: (context, absoluteOffset) => _updateScroll(absoluteOffset: absoluteOffset),
      child: BlocBuilder<PedestalsParallaxBloc, PedestalsParallaxState>(
        buildWhen: ((_, currentState) => currentState.isImageVisible),
        builder: (context, state) {
          return Positioned(
            left: 0,
            right: 0,
            bottom: state.entryPosition == null
              ? _initialOffset(context: context)
              : state.parallaxOffset.h +_initialOffset(context: context),
            child: SizedBox(
              key: _sectionKey,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * (2/3),
              child: RiveAnimation.asset(
                'rive/main_rive.riv',
                artboard: 'pedestals',
                controllers: [_riveAnimationController],
                fit: BoxFit.fitWidth,
              ),
            )
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    _riveAnimationController.dispose();
    super.dispose();
  }

  double _initialOffset({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return -60.h;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return -70.h;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return -100.h;
    }
    return -150.h
    ;
  }
  
  void _updateScroll({required double absoluteOffset}) {
    bool imageVisible = _visibilityFinder.isVisible();
    bool visibilityChanged = false;
    
    if (imageVisible != BlocProvider.of<PedestalsParallaxBloc>(context).state.isImageVisible) {
      visibilityChanged = true;
      BlocProvider.of<PedestalsParallaxBloc>(context).add(ImageVisibilityChanged(
        isImageVisible: imageVisible,
        entryPosition: imageVisible ? absoluteOffset : null,
        currentPosition: absoluteOffset
      ));
    }

    if (imageVisible && !visibilityChanged && (absoluteOffset - BlocProvider.of<PedestalsParallaxBloc>(context).state.entryPosition! <= BlocProvider.of<PedestalsParallaxBloc>(context).state.maxPosition)) {
      BlocProvider.of<PedestalsParallaxBloc>(context).add(CurrentPositionChanged(currentPosition: absoluteOffset));
    }
  }
}