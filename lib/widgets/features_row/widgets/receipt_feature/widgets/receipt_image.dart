import 'package:customer_web/body/key_holder_cubit/key_holder_cubit.dart';
import 'package:customer_web/body/scroll_watcher_cubit.dart';
import 'package:customer_web/resources/visibility_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:transparent_image/transparent_image.dart';

import '../bloc/receipt_image_parallax_bloc.dart';

class ReceiptImage extends StatelessWidget {
  static const double _initialOffset = 200;
  final VisibilityFinder _visibilityFinder = const VisibilityFinder();

  const ReceiptImage({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<ScrollWatcherCubit, double>(
      listener: (context, absoluteOffset) => _updateScroll(context: context, absoluteOffset: absoluteOffset),
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
                    key: BlocProvider.of<KeyHolderCubit>(context).state.receiptImageKey,
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

  void _updateScroll({required BuildContext context, required double absoluteOffset}) {
    BlocProvider.of<ReceiptImageParallaxBloc>(context).add(CurrentPositionChanged(currentPosition: absoluteOffset));

    bool imageVisible = _visibilityFinder.isVisible(parentKey: BlocProvider.of<KeyHolderCubit>(context).state.mainScrollKey, childKey: BlocProvider.of<KeyHolderCubit>(context).state.receiptImageKey);
    if (imageVisible != BlocProvider.of<ReceiptImageParallaxBloc>(context).state.isImageVisible) {
      BlocProvider.of<ReceiptImageParallaxBloc>(context).add(ImageVisibilityChanged(
        isImageVisible: imageVisible,
        entryPosition: imageVisible ? absoluteOffset : null
      ));
    }
  }
}