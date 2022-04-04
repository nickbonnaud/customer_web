import 'package:customer_web/body/key_holder_cubit/key_holder_cubit.dart';
import 'package:customer_web/body/scroll_watcher_cubit.dart';
import 'package:customer_web/resources/visibility_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:rive/rive.dart';

import 'bloc/pedestals_parallax_bloc.dart';


class Pedestals extends StatelessWidget {
  final VisibilityFinder _visibilityFinder = const VisibilityFinder(enterAnimationMinHeight: 250);

  const Pedestals({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScrollWatcherCubit, double>(
      listener: (context, absoluteOffset) => _updateScroll(context: context, absoluteOffset: absoluteOffset),
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
              key: BlocProvider.of<KeyHolderCubit>(context).state.pedestalsKey,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * (2/3),
              child: const RiveAnimation.asset(
                'rive/pedestals.riv',
                artboard: 'pedestals',
                animations: ['pedestals_animation'],
                fit: BoxFit.fitWidth,
              ),
            )
          );
        }
      ),
    );
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
  
  void _updateScroll({required BuildContext context, required double absoluteOffset}) {
    bool imageVisible = _visibilityFinder.isVisible(parentKey: BlocProvider.of<KeyHolderCubit>(context).state.mainScrollKey, childKey: BlocProvider.of<KeyHolderCubit>(context).state.pedestalsKey);
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