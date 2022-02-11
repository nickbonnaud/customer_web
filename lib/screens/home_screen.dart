import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ScrollWatcherCubit>(
        create: (_) => ScrollWatcherCubit(),
        child: HomeScreenBody(),
      ),
    );
  }
}