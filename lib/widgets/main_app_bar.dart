import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class MainAppBar extends StatelessWidget {

  const MainAppBar({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xfff5f5f3),
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: const Image(
          image: AssetImage('assets/abstract_logo.png'),
          fit: BoxFit.contain,
        ),
      ),
      floating: true,
      snap: true,
      actions: [
        TextButton(
          onPressed: () => _goToBusiness(),
          child: Text(
            "Business Partners",
            style: TextStyle(
              fontSize: _textSize(context: context)
            ),
          )
        )
      ],
    );
  }

  double _textSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 48.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return 32.sp;
    }
    return 24.sp;
  }

  void _goToBusiness() {
    // TODO
    // add go to business app page
  }
}