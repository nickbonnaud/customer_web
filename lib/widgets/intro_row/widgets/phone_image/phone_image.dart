import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/page_loaded_cubit.dart';
import 'widgets/phone_image_body.dart';

class PhoneImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: BlocProvider<PageLoadedCubit>(
        create: (_) => PageLoadedCubit(),
        child: PhoneImageBody(),
      ),
    );
  }
}