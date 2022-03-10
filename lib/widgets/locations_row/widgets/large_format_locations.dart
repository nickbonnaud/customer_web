import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'locations_background.dart';
import 'locations_text.dart';
import 'pedestals/pedestals.dart';

class LargeFormatLocations extends StatelessWidget {
  final GlobalKey _mainScrollKey;
  final String _titleText;
  final String _bodyText;

  const LargeFormatLocations({
    required GlobalKey mainScrollKey,
    required String titleText,
    required String bodyText
  })
    : _mainScrollKey = mainScrollKey,
      _titleText = titleText,
      _bodyText = bodyText;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * (2/3),
      color: const Color.fromRGBO(248, 246, 246, 100),
      child: Stack(
        children: [
          LocationsBackground(),
          _text(context: context),
          Pedestals(mainScrollKey: _mainScrollKey)
        ],
      ),
    );
  }

  Widget _text({required BuildContext context}) {
    return Positioned(
      top: 20.h,
      left: 20.w,
      child: SizedBox(
        width: _width(context: context),
        child: LocationsText(titleText: _titleText, bodyText: _bodyText),
      ),
    );
  }

  double _width({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return .55.sw;
    }
    return .6.sw;
  }
}