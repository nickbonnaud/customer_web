import 'package:customer_web/widgets/intro_row/bloc/intro_widgets_loaded_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/splash_overlay_body.dart';

class SplashOverlay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroWidgetsLoadedBloc, IntroWidgetsLoadedState>(
      builder: (context, state) {
        return state.overlayAnimationPlayed
          ? Container()
          : SplashOverlayBody();
      }
    );
  }
}