import 'package:customer_web/resources/text_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/notification_screen_image.dart';

class NotificationScreen extends StatelessWidget {
  final TextSizer _textSizer = const TextSizer();
  final GlobalKey _mainScrollKey;

  const NotificationScreen({required GlobalKey mainScrollKey, Key? key})
    : _mainScrollKey = mainScrollKey,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage('backgrounds/background_1.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "AI driven payments",
                  style: TextStyle(
                    fontSize: _textSizer.halfRow(context: context),
                    fontWeight: FontWeight.w800,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Automatically pays bill",
                  style: TextStyle(
                    fontSize: _textSizer.halfRow(context: context),
                    fontWeight: FontWeight.w800,
                    color: Colors.white
                  ),
                )
              ],
            )
          ),
          _separator(context: context),
          Expanded(
            child: NotificationScreenImage(mainScrollKey: _mainScrollKey)
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