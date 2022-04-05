import 'package:customer_web/resources/text_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:transparent_image/transparent_image.dart';

import 'widgets/notification_screen_image.dart';

class NotificationScreen extends StatelessWidget {
  final TextSizer _textSizer = const TextSizer();

  const NotificationScreen({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: '/assets/backgrounds/background_1.jpg'
          ).image,
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
          const Expanded(
            child: NotificationScreenImage()
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