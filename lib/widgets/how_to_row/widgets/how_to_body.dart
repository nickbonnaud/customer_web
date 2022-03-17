import 'dart:async';

import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/resources/visibility_finder.dart';
import 'package:customer_web/widgets/how_to_row/widgets/widgets/how_to_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../bloc/how_to_bloc.dart';
import 'widgets/how_to_text/how_to_text.dart';

class HowToBody extends StatefulWidget {
  final GlobalKey _mainScrollKey;

  const HowToBody({required GlobalKey mainScrollKey})
    : _mainScrollKey = mainScrollKey;

  @override
  State<HowToBody> createState() => _HowToBodyState();
}

class _HowToBodyState extends State<HowToBody> {
  static const double _enterMinHeight = 400;
  
  final GlobalKey _bodyKey = GlobalKey();

  late VisibilityFinder _visibilityFinder;

  Timer? _timer;
  
  @override
  void initState() {
    super.initState();
    _visibilityFinder = VisibilityFinder(parentKey: widget._mainScrollKey, childKey: _bodyKey, enterAnimationMinHeight: _enterMinHeight);
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<ScrollWatcherCubit, double>(
      listener: (context, absoluteOffset) => _updateScroll(absoluteOffset: absoluteOffset),
      child: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
        ? _column()
        : _row()
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _row() {
    return Row(
      key: _bodyKey,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HowToImage(),
        Expanded(
          child: HowToText()
        )
      ],
    );
  }

  Widget _column() {
    return Column(
      key: _bodyKey,
      children: [
        HowToImage(),
        SizedBox(height: 30.h),
        HowToText(),
        SizedBox(height: 20.h),
      ],
    );
  }

  void _updateScroll({required double absoluteOffset}) {
    bool sectionCurrentlyVisible = _visibilityFinder.isVisible();
    bool sectionWasVisible = BlocProvider.of<HowToBloc>(context).state.isSectionVisible;

    if (sectionCurrentlyVisible != sectionWasVisible) {
      sectionCurrentlyVisible ? _play() : _pause();
      BlocProvider.of<HowToBloc>(context).add(SectionVisibilityChanged());
    }
  }

  void _play() {
    _timer ??= Timer.periodic(const Duration(seconds: 8), (timer) {
      BlocProvider.of<HowToBloc>(context).add(IndexChanged());
    });
  }

  void _pause() {
    _timer?.cancel();
    _timer = null;
  }
}