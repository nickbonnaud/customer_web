import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/page_loaded_cubit.dart';
import 'widgets/planets_body.dart';

class Planets extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: BlocProvider<PageLoadedCubit>(
        create: (_) => PageLoadedCubit(),
        child: PlanetsBody(),
      )
    );
  }
}