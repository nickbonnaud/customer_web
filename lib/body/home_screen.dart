import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'intro_widgets_loaded_bloc/intro_widgets_loaded_bloc.dart';
import 'key_holder_cubit/key_holder_cubit.dart';
import 'scroll_watcher_cubit.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key})
    : super(key: key);

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
          ),

          BlocProvider<KeyHolderCubit>(
            create: (_) => KeyHolderCubit()
          )
        ],
        child: const HomeScreenBody()
      )
    );
  }
}