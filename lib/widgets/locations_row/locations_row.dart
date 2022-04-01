import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/large_format_locations.dart';
import 'widgets/pedestals/bloc/pedestals_parallax_bloc.dart';
import 'widgets/small_format_locations.dart';

class LocationsRow extends StatelessWidget {
  static const String _titleText = "Nova Pay Anywhere";
  static const String _bodyText = "Use at all your favorite businesses. Nova Pay is compatible with most payment systems.";
  final GlobalKey _mainScrollKey;

  const LocationsRow({required GlobalKey mainScrollKey, Key? key})
    : _mainScrollKey = mainScrollKey,
      super(key: key);

    @override
  Widget build(BuildContext context) {
    return BlocProvider<PedestalsParallaxBloc>(
      create: (_) => PedestalsParallaxBloc(),
      child: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
        ? SmallFormatLocations(mainScrollKey: _mainScrollKey, titleText: _titleText, bodyText: _bodyText)
        : LargeFormatLocations(mainScrollKey: _mainScrollKey, titleText: _titleText, bodyText: _bodyText)
    );
  }
}