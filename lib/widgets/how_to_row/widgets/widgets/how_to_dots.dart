import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:customer_web/themes/global_colors.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../bloc/how_to_bloc.dart';

class HowToDots extends StatelessWidget {
  late final List<double> _leftOffsets;
  
  @override
  Widget build(BuildContext context) {
    _setDots(context: context);
    return SizedBox(
      width: _containerWidth(context: context) + (2 * _dotSize(context: context)),
      height: _dotSize(context: context) + 5.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Stack(
          children: _dots(context: context)
            ..add(_activeDot()),
        )
      )
    );
  }

  List<Widget> _dots({required BuildContext context}) {
    return List.generate(_leftOffsets.length, (index) {      
      return Positioned(
        left: _leftOffsets[index],
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _dotTapped(context: context, index: index),
            child: Container(
              width: _dotSize(context: context),
              height: _dotSize(context: context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: Theme.of(context).colorScheme.callToAction
                )
              ),
            ),
          )
        )
      );
    });
  }

  Widget _activeDot() {
    return BlocBuilder<HowToBloc, HowToState>(
      builder: (context, state) {
        return AnimatedPositioned(
          curve: Curves.easeIn,
          left: _leftOffsets[state.switcherIndex % _leftOffsets.length],
          duration: const Duration(seconds: 1),
          child: Container(
            width: _dotSize(context: context),
            height: _dotSize(context: context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.callToAction,
              border: Border.all(
                color: Theme.of(context).colorScheme.callToAction
              )
            ),
          ),
        );
      }
    );
  }

  double _containerWidth({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return .25.sw;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return .2.sw;
    }
    return .15.sw;
  }
  
  double _dotSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 30.w;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return 20.w;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return 17.w;
    }
    return 15.w;
  }

  void _setDots({required BuildContext context}) {
    _leftOffsets = [];
    double segmentWidth = (_containerWidth(context: context) - (_dotSize(context: context) * HowToBloc.imageAssets.length)) / (HowToBloc.imageAssets.length - 1);
    
    HowToBloc.imageAssets.asMap().forEach((index, _) {
      _leftOffsets.add(index == 0
        ? 0
        : _leftOffsets[index - 1] + _dotSize(context: context) + segmentWidth
      );
    });
  }

  void _dotTapped({required BuildContext context, required int index}) {
    BlocProvider.of<HowToBloc>(context).add(IndexManuallyChanged(selectedIndex: index));
  }
}