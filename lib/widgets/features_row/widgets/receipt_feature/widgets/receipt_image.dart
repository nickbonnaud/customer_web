import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/resources/visibility_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:transparent_image/transparent_image.dart';

import '../bloc/receipt_image_parallax_bloc.dart';

class ReceiptImage extends StatefulWidget {
  final GlobalKey _mainScrollKey;

  const ReceiptImage({required GlobalKey mainScrollKey})
    : _mainScrollKey = mainScrollKey;

  @override
  State<ReceiptImage> createState() => _ReceiptImageState();
}

class _ReceiptImageState extends State<ReceiptImage> {
  static const double _initialOffset = 200;
  final GlobalKey _imageKey = GlobalKey();
  
  late ReceiptImageParallaxBloc _parallaxBloc;
  late VisibilityFinder _visibilityFinder;
  
  @override
  void initState() {
    super.initState();
    _parallaxBloc = BlocProvider.of<ReceiptImageParallaxBloc>(context);
    _visibilityFinder = VisibilityFinder(parentKey: widget._mainScrollKey, childKey: _imageKey);
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<ScrollWatcherCubit, double>(
      listener: (context, absoluteOffset) => _updateScroll(absoluteOffset: absoluteOffset),
      child: SizedBox(
        height: .6.sh,
        width: .2.sw,
        child: Stack(
          children: [
            BlocBuilder<ReceiptImageParallaxBloc, ReceiptImageParallaxState>(
              buildWhen: (_, currentState) => currentState.isImageVisible,
              builder: (context, state) {
                return Positioned(
                  height: .5.sh,
                  left: ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ? null : 10.w,
                  right: ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ? 0 : null,
                  top: state.entryPosition == null
                    ? _initialOffset.h
                    : state.parallaxOffset.h + _initialOffset.h,
                  child: FadeInImage.memoryNetwork(
                    key: _imageKey,
                    placeholder: kTransparentImage,
                    image: '/assets/mock_ups/screen_7.png',
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

  @override
  void dispose() {
    _parallaxBloc.close();
    super.dispose();
  }

  void _updateScroll({required double absoluteOffset}) {
    _parallaxBloc.add(CurrentPositionChanged(currentPosition: absoluteOffset));

    bool imageVisible = _visibilityFinder.isVisible();
    if (imageVisible != _parallaxBloc.state.isImageVisible) {
      _parallaxBloc.add(ImageVisibilityChanged(
        isImageVisible: imageVisible,
        entryPosition: imageVisible ? absoluteOffset : null
      ));
    }
  }
}