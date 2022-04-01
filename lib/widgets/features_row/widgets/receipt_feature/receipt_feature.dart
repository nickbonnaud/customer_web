import 'package:customer_web/resources/text_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'bloc/receipt_image_parallax_bloc.dart';
import 'widgets/receipt_image.dart';

class ReceiptFeature extends StatelessWidget {
  final TextSizer _textSizer = const TextSizer();
  final GlobalKey _mainScrollKey;

  const ReceiptFeature({required GlobalKey mainScrollKey, Key? key})
    : _mainScrollKey = mainScrollKey,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Container(
        padding: EdgeInsets.only(top: 20.h, right: 20.w),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage('backgrounds/background_3.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BlocProvider<ReceiptImageParallaxBloc>(
                create: (_) => ReceiptImageParallaxBloc(),
                child: ReceiptImage(mainScrollKey: _mainScrollKey),
              )
            ),
            _separator(context: context),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Receipts updated in real time.",
                    style: TextStyle(
                      fontSize: _textSizer.fullRowHeader(context: context),
                      fontWeight: FontWeight.w800,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 60.h),
                  Text(
                    "View live bill at anytime, pay when you're ready.",
                    style: TextStyle(
                      fontSize: _textSizer.fullRowHeader(context: context),
                      fontWeight: FontWeight.w800,
                      color: Colors.white
                    ),
                  )
                ],
              )
            )
          ],
        ),
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