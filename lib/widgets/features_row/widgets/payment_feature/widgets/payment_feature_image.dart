import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/resources/visibility_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:transparent_image/transparent_image.dart';

import '../bloc/payment_feature_parallax_bloc.dart';

class PaymentFeatureImage extends StatelessWidget {
  static const double _initialOffset = 100;
  final GlobalKey _imageKey = GlobalKey();
  final VisibilityFinder _visibilityFinder = const VisibilityFinder();
  
  final GlobalKey _mainScrollKey;

  PaymentFeatureImage({required GlobalKey mainScrollKey, Key? key})
    : _mainScrollKey = mainScrollKey,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScrollWatcherCubit, double>(
      listener: (context, absoluteOffset) => _updateScroll(context: context, absoluteOffset: absoluteOffset),
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

  void _updateScroll({required BuildContext context, required double absoluteOffset}) {
    BlocProvider.of<PaymentFeatureParallaxBloc>(context).add(CurrentPositionChanged(currentPosition: absoluteOffset));

    bool imageVisible = _visibilityFinder.isVisible(parentKey: _mainScrollKey, childKey: _imageKey);
    if (imageVisible != BlocProvider.of<PaymentFeatureParallaxBloc>(context).state.isImageVisible) {
      BlocProvider.of<PaymentFeatureParallaxBloc>(context).add(ImageVisibilityChanged(
        isImageVisible: imageVisible,
        entryPosition: imageVisible ? absoluteOffset : null
      ));
    }
  }
}