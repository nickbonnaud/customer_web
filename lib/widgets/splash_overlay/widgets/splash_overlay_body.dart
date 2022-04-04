import 'package:customer_web/body/intro_widgets_loaded_bloc/intro_widgets_loaded_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashOverlayBody extends StatefulWidget {

  const SplashOverlayBody({Key? key})
    : super(key: key);
  
  @override
  State<SplashOverlayBody> createState() => _SplashOverlayBodyState();
}

class _SplashOverlayBodyState extends State<SplashOverlayBody> with SingleTickerProviderStateMixin {
  final Image _introLogo = Image.asset('abstract_logo_large.png');

  @override
  void initState() {
    super.initState();
    _introLogo.image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((_, __) {
      if (mounted) {
        BlocProvider.of<IntroWidgetsLoadedBloc>(context).add(LoadingLogoLoaded());
      }
    }));
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroWidgetsLoadedBloc, IntroWidgetsLoadedState>(
      buildWhen: (previous, current) => !previous.widgetsLoaded && current.widgetsLoaded,
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state.widgetsLoaded ? 0 : 1,
          duration: const Duration(seconds: 1),
          onEnd: () => BlocProvider.of<IntroWidgetsLoadedBloc>(context).add(OverlayAnimationPlayed()),
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: _introLogo,
            )
          ),
        );
      }
    );
  }
}