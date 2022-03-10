import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/resources/visibility_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:transparent_image/transparent_image.dart';

import '../bloc/payment_feature_parallax_bloc.dart';

class PaymentFeatureImage extends StatefulWidget {
  final GlobalKey _mainScrollKey;

  const PaymentFeatureImage({required GlobalKey mainScrollKey})
    : _mainScrollKey = mainScrollKey;

  @override
  State<PaymentFeatureImage> createState() => _PaymentFeatureImageState();
}

class _PaymentFeatureImageState extends State<PaymentFeatureImage> {
  static const double _initialOffset = 100;
  final GlobalKey _imageKey = GlobalKey();

  late PaymentFeatureParallaxBloc _parallaxBloc;
  late VisibilityFinder _visibilityFinder;

  @override
  void initState() {
    super.initState();
    _parallaxBloc = BlocProvider.of<PaymentFeatureParallaxBloc>(context);
    _visibilityFinder = VisibilityFinder(parentKey: widget._mainScrollKey, childKey: _imageKey);
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<ScrollWatcherCubit, double>(
      listener: (context, absoluteOffset) => _updateScroll(absoluteOffset: absoluteOffset),
      child: SizedBox(
        height: .7.sh,
        width: ResponsiveWrapper.of(context).isSmallerThan(MOBILE)
          ? .4.sw : .25.sw,
        child: Stack(
          children: [
            BlocBuilder<PaymentFeatureParallaxBloc, PaymentFeatureParallaxState>(
              buildWhen: (_, currentState) => currentState.isImageVisible,
              builder: (context, state) {
                return Positioned(
                  height: .6.sh,
                  left: 0,
                  right: 0,
                  top: state.entryPosition == null
                    ? _initialOffset.h
                    : state.parallaxOffset.h + _initialOffset.h,
                  child: FadeInImage.memoryNetwork(
                    key: _imageKey,
                    placeholder: kTransparentImage,
                    image: '/assets/mock_ups/screen_4.png',
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