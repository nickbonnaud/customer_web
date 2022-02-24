import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/image_switcher_cubit.dart';



class ImageSwitcher extends StatefulWidget {

  @override
  State<ImageSwitcher> createState() => _ImageSwitcherState();
}
  
class _ImageSwitcherState extends State<ImageSwitcher> {
  late final Timer _timer;
  
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      context.read<ImageSwitcherCubit>().changeImage();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageSwitcherCubit, int>(
      builder: (context, index) {
        return AnimatedSwitcher(
          duration: const Duration(seconds: 2),
          child: Image(
            image: AssetImage(ImageSwitcherCubit.imageAssets[index % ImageSwitcherCubit.imageAssets.length]),
            fit: BoxFit.contain,
            key: UniqueKey(),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}