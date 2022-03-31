import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/widgets/intro_row/bloc/intro_widgets_loaded_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ScrollWatcherCubit>(
            create: (_) => ScrollWatcherCubit(),
          ),

          BlocProvider<IntroWidgetsLoadedBloc>(
            create: (_) => IntroWidgetsLoadedBloc()
          )
        ],
        child: HomeScreenBody()
      )
    );
  }
}