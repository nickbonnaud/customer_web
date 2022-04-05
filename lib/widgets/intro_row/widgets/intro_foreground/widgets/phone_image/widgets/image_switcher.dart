import 'dart:async';

import 'package:customer_web/body/intro_widgets_loaded_bloc/intro_widgets_loaded_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import 'cubit/image_switcher_cubit.dart';

class ImageSwitcher extends StatefulWidget {

  const ImageSwitcher({Key? key})
    : super(key: key);

  @override
  State<ImageSwitcher> createState() => _ImageSwitcherState();
}
  
class _ImageSwitcherState extends State<ImageSwitcher> {
  final List<FadeInImage> _images = [
    _createImage(url: '/assets/mock_ups/screen_0.png'),
    _createImage(url: '/assets/mock_ups/screen_1.png'),
    _createImage(url: '/assets/mock_ups/screen_2.png'),
    _createImage(url: '/assets/mock_ups/screen_3.png'),
  ];

  late final Timer _timer;
  
  @override
  void initState() {
    super.initState();
    _images[0].image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((_, __) {
      if (mounted) {
        BlocProvider.of<IntroWidgetsLoadedBloc>(context).add(PhoneImageLoaded());

        _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
          context.read<ImageSwitcherCubit>().changeImage();
        });
      }
    }));
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageSwitcherCubit, int>(
      builder: (context, index) {
        return AnimatedSwitcher(
          duration: const Duration(seconds: 2),
          child: _images[index % _images.length]
        );
      }
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  static FadeInImage _createImage({required String url}) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: url,
      fit: BoxFit.contain,
      key: UniqueKey(),
    );
  }
}