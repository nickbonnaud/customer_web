import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/explanation_bloc.dart';
import 'widgets/explanation_row_body.dart';

class ExplanationRow extends StatelessWidget {
  final GlobalKey _mainScrollKey;

  const ExplanationRow({required GlobalKey mainScrollKey, Key? key})
    : _mainScrollKey = mainScrollKey,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExplanationBloc>(
      create: (_) => ExplanationBloc(),
      child: ExplanationRowBody(mainScrollKey: _mainScrollKey),
    );
  }
}