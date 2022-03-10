import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/resources/visibility_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:transparent_image/transparent_image.dart';

import '../bloc/notification_screen_parallax_bloc.dart';

class NotificationScreenImage extends StatefulWidget {
  final GlobalKey _mainScrollKey;

  const NotificationScreenImage({required GlobalKey mainScrollKey})
    : _mainScrollKey = mainScrollKey;

  @override
  State<NotificationScreenImage> createState() => _NotificationScreenImageState();
}

class _NotificationScreenImageState extends State<NotificationScreenImage> {
  static const double _initialOffset = 120;
  final GlobalKey _imageKey = GlobalKey();

  late VisibilityFinder _visibilityFinder;
  
  @override
  void initState() {
    super.initState();
    _visibilityFinder = VisibilityFinder(parentKey: widget._mainScrollKey, childKey: _imageKey);
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<ScrollWatcherCubit, double>(
      listener: (context, absoluteOffset) => _updateScroll(absoluteOffset: absoluteOffset),
      child: SizedBox(
        height: .6.sh,
        width: ResponsiveWrapper.of(context).isSmallerThan(MOBILE)
          ? .2.sw : .15.sw,
        child: Stack(
          children: [
            BlocBuilder<NotificationScreenParallaxBloc, NotificationScreenParallaxState>(
              buildWhen: (_, currentState) => currentState.isImageVisible,
              builder: (context, state) {
                return Positioned(
                  height: .5.sh,
                  left: 0,
                  top: state.entryPosition == null
                    ? _initialOffset.h
                    : state.parallaxOffset.h + _initialOffset.h,
                  child: FadeInImage.memoryNetwork(
                    key: _imageKey,
                    placeholder: kTransparentImage,
                    image: '/assets/mock_ups/screen_6.png',
                    fit: BoxFit.contain,
                  )
                );
              }
            )
          ],
        ),
      ),
    );
  }

  void _updateScroll({required double absoluteOffset}) {
    BlocProvider.of<NotificationScreenParallaxBloc>(context).add(CurrentPositionChanged(currentPosition: absoluteOffset));

    bool imageVisible = _visibilityFinder.isVisible();
    if (imageVisible != BlocProvider.of<NotificationScreenParallaxBloc>(context).state.isImageVisible) {
      BlocProvider.of<NotificationScreenParallaxBloc>(context).add(ImageVisibilityChanged(
        isImageVisible: imageVisible,
        entryPosition: imageVisible ? absoluteOffset : null
      ));
    }
  }
}