import 'package:customer_web/resources/text_sizer.dart';
import 'package:customer_web/widgets/how_to_row/widgets/widgets/how_to_text/widgets/download_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../bloc/how_to_bloc.dart';

class HowToText extends StatelessWidget {
  final TextSizer _textSizer = const TextSizer();
  final Duration _duration = const Duration(seconds: 1);

  const HowToText({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<HowToBloc, HowToState>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: _duration,
              child: Text(
                HowToBloc.titleTexts[state.switcherIndex % HowToBloc.titleTexts.length],
                style: TextStyle(
                  fontSize: _textSizer.fullRowHeader(context: context),
                  fontWeight: FontWeight.w800,
                ),
                textAlign: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                  ? TextAlign.center
                  : TextAlign.start,
                key: UniqueKey(),
              ),
            );
          },
        ),
        SizedBox(height: 20.h),
        BlocBuilder<HowToBloc, HowToState>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: _duration,
              child: Text(
                HowToBloc.bodyTexts[state.switcherIndex % HowToBloc.bodyTexts.length],
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: _textSizer.halfRow(context: context),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                  ? TextAlign.center
                  : TextAlign.start,
                key: UniqueKey(),
              )
            );
          }
        ),
        SizedBox(height: 60.h),
        const DownloadAction()
      ],
    );
  }
}