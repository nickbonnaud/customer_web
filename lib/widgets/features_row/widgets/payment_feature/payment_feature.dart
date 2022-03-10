import 'package:customer_web/resources/text_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/payment_feature_parallax_bloc.dart';
import 'widgets/payment_feature_image.dart';

class PaymentFeature extends StatelessWidget {
  final TextSizer _textSizer = TextSizer();
  final GlobalKey _mainScrollKey;

  PaymentFeature({required GlobalKey mainScrollKey})
    : _mainScrollKey = mainScrollKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage('backgrounds/background_2.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "No tapping, swiping, or scanning.",
                    style: TextStyle(
                      fontSize: _textSizer.fullRowHeader(context: context),
                      fontWeight: FontWeight.w800,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 60.h),
                  Text(
                    "Transactions are automatically paid by Nova.",
                    style: TextStyle(
                      fontSize: _textSizer.fullRowHeader(context: context),
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  )
                ],
              )
            ),
            BlocProvider<PaymentFeatureParallaxBloc>(
              create: (_) => PaymentFeatureParallaxBloc(),
              child: PaymentFeatureImage(mainScrollKey: _mainScrollKey),
            )
          ],
        ),
      ),
    );
  }
}