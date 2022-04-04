import 'package:customer_web/resources/text_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/business_screen_image.dart';

class BusinessScreen extends StatelessWidget {
  final TextSizer _textSizer = const TextSizer();

  const BusinessScreen({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.w),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage('backgrounds/background_0.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: BusinessScreenImage()
          ),
          _separator(context: context),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Hassle free",
                  style: TextStyle(
                    fontSize: _textSizer.halfRow(context: context),
                    fontWeight: FontWeight.w800,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Pay in app",
                  style: TextStyle(
                    fontSize: _textSizer.halfRow(context: context),
                    fontWeight: FontWeight.w800,
                    color: Colors.white
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }

  Widget _separator({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return SizedBox(width: 20.w);
    }
    return Container();
  }
}