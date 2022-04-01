import 'package:customer_web/widgets/intro_row/bloc/intro_widgets_loaded_bloc.dart';
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
  late Animation<double> _opacityAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _imageLoadedListener();

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _opacityAnimation = Tween<double>(begin: 1, end: .4).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
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
              child: _logo(),
            )
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _logo() {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: _introLogo,
    );
  }
  
  void _imageLoadedListener() {
    _introLogo.image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((_, __) {
      if (mounted) {
        _animationController.forward();
        BlocProvider.of<IntroWidgetsLoadedBloc>(context).add(LoadingLogoLoaded());
      }
    }));
  }
}