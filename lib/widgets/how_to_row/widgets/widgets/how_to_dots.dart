import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:customer_web/themes/global_colors.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../bloc/how_to_bloc.dart';

class HowToDots extends StatelessWidget {
  const HowToDots({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _containerWidth(context: context) + (2 * _dotSize(context: context)),
      height: _dotSize(context: context) + 5.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: LayoutBuilder(
          builder:(context, constraints) {
            List<double> dotPositions = _setDotPositions(context: context, width: constraints.maxWidth);
            return Stack(
              children: _dots(context: context, dotPositions: dotPositions)
                ..add(_activeDot(dotPositions: dotPositions))
            );
          },
        ),
      ),
    );
  }

  List<double> _setDotPositions({required BuildContext context, required double width}) {
    double segmentWidth = (width - (_dotSize(context: context) * HowToBloc.imageAssets.length)) / (HowToBloc.imageAssets.length - 1);
    List<double> dotPositions = [];
    
    HowToBloc.imageAssets.asMap().forEach((index, _) {
      dotPositions.add(index == 0
        ? 0
        : dotPositions[index - 1] + _dotSize(context: context) + segmentWidth
      );
    });

    return dotPositions;
  }

  List<Widget> _dots({required List<double> dotPositions, required BuildContext context}) {
    return List.generate(dotPositions.length, (index) {      
      return Positioned(
        left: dotPositions[index],
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

  Widget _activeDot({required List<double> dotPositions}) {
    return BlocBuilder<HowToBloc, HowToState>(
      builder: (context, state) {
        return AnimatedPositioned(
          curve: Curves.easeIn,
          left: dotPositions[state.switcherIndex % dotPositions.length],
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

  void _dotTapped({required BuildContext context, required int index}) {
    BlocProvider.of<HowToBloc>(context).add(IndexManuallyChanged(selectedIndex: index));
  }
}