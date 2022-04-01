import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/resources/visibility_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:transparent_image/transparent_image.dart';

import '../bloc/business_screen_parallax_bloc.dart';

class BusinessScreenImage extends StatelessWidget {
  static const double _initialOffset = 75;
  final GlobalKey _imageKey = GlobalKey();
  final VisibilityFinder _visibilityFinder = const VisibilityFinder();

  final GlobalKey _mainScrollKey;

  BusinessScreenImage({required GlobalKey mainScrollKey, Key? key})
    : _mainScrollKey = mainScrollKey,
      super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<ScrollWatcherCubit, double>(
      listener: (context, absoluteOffset) => _updateScroll(context: context, absoluteOffset: absoluteOffset),
      child: SizedBox(
        height: .6.sh,
        width: ResponsiveWrapper.of(context).isSmallerThan(MOBILE)
          ? .2.sw : .15.sw,
        child: Stack(
          children: [
            BlocBuilder<BusinessScreenParallaxBloc, BusinessScreenParallaxState>(
              buildWhen: (_, currentState) => currentState.isImageVisible,
              builder: (context, state) {
                return Positioned(
                  height: .5.sh,
                  right: 0,
                  top: state.entryPosition == null
                    ? _initialOffset.h
                    : state.parallaxOffset.h + _initialOffset.h,
                  child: FadeInImage.memoryNetwork(
                    key: _imageKey,
                    placeholder: kTransparentImage,
                    image: '/assets/mock_ups/screen_5.png',
                    fit: BoxFit.contain,
                  )
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _updateScroll({required BuildContext context, required double absoluteOffset}) {
    BlocProvider.of<BusinessScreenParallaxBloc>(context).add(CurrentPositionChanged(currentPosition: absoluteOffset));

    bool imageVisible = _visibilityFinder.isVisible(parentKey: _mainScrollKey, childKey: _imageKey);
    if (imageVisible != BlocProvider.of<BusinessScreenParallaxBloc>(context).state.isImageVisible) {
      BlocProvider.of<BusinessScreenParallaxBloc>(context).add(ImageVisibilityChanged(
        isImageVisible: imageVisible,
        entryPosition: imageVisible ? absoluteOffset : null
      ));
    }
  }
}