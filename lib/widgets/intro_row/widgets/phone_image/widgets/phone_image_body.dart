import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/page_loaded_cubit.dart';

class PhoneImageBody extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _PhoneImageBodyState();
}

class _PhoneImageBodyState extends State<PhoneImageBody> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        context.read<PageLoadedCubit>().loaded();
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageLoadedCubit, bool>(
      builder: (context, pageLoaded) {
        return AnimatedOpacity(
          opacity: pageLoaded ? 1 : 0, 
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            height: pageLoaded ? .5.sh : .1.sh,
            duration: const Duration(seconds: 1),
            child: const Image(
              image: AssetImage('mock_ups/test.png'),
              fit: BoxFit.contain,
            )
          ),
        );
      }
    );
  }
}