import 'dart:async';

import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/resources/visibility_finder.dart';
import 'package:customer_web/widgets/how_to_row/widgets/widgets/how_to_dots.dart';
import 'package:customer_web/widgets/how_to_row/widgets/widgets/how_to_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../bloc/how_to_bloc.dart';
import 'widgets/how_to_text/how_to_text.dart';

class HowToBody extends StatefulWidget {
  final GlobalKey _mainScrollKey;

  const HowToBody({required GlobalKey mainScrollKey, Key? key})
    : _mainScrollKey = mainScrollKey,
      super(key: key);

  @override
  State<HowToBody> createState() => _HowToBodyState();
}

class _HowToBodyState extends State<HowToBody> {
  final GlobalKey _bodyKey = GlobalKey();
  final VisibilityFinder _visibilityFinder = const VisibilityFinder(enterAnimationMinHeight: 400);

  late Timer _timer;
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ScrollWatcherCubit, double>(
          listener: (context, absoluteOffset) => _updateScroll(absoluteOffset: absoluteOffset),
        ),
        
        BlocListener<HowToBloc, HowToState>(
          listenWhen: (previous, current) => !previous.isManualChange && current.isManualChange,
          listener: (context, state) => _resetTimer()
        )
      ],
      child: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
        ? _column()
        : _row()
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _row() {
    return Row(
      key: _bodyKey,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const HowToImage(),
            const HowToDots(),
            SizedBox(height: 10.h)
          ],
        ),
        const Expanded(
          child: HowToText()
        )
      ],
    );
  }

  Widget _column() {
    return Column(
      key: _bodyKey,
      children: [
        const HowToImage(),
        const HowToDots(),
        SizedBox(height: 30.h),
        const HowToText(),
        SizedBox(height: 20.h),
      ],
    );
  }

  void _updateScroll({required double absoluteOffset}) {
    bool sectionCurrentlyVisible = _visibilityFinder.isVisible(parentKey: widget._mainScrollKey, childKey: _bodyKey);
    bool sectionWasVisible = BlocProvider.of<HowToBloc>(context).state.isSectionVisible;

    if (sectionCurrentlyVisible != sectionWasVisible) {
      sectionCurrentlyVisible ? _play() : _pause();
      BlocProvider.of<HowToBloc>(context).add(SectionVisibilityChanged());
    }
  }

  void _resetTimer() {
    _pause();
    _play();
  }

  void _play() {
    _timer = Timer.periodic(const Duration(seconds: 8), (timer) {
      BlocProvider.of<HowToBloc>(context).add(IndexChanged());
    });
  }

  void _pause() {
    _timer.cancel();
  }
}