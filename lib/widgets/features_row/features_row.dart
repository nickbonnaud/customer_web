import 'package:customer_web/widgets/features_row/widgets/receipt_feature/receipt_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'widgets/payment_feature/payment_feature.dart';
import 'widgets/show_bill_features/show_bill_features.dart';

class FeaturesRow extends StatelessWidget {
  final GlobalKey _mainScrollKey;

  const FeaturesRow({required GlobalKey mainScrollKey})
    : _mainScrollKey = mainScrollKey;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 30.h),
          Text(
            "A Smarter way to Pay",
            style: TextStyle(
              fontSize: _titleFontSize(context: context),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Seamless • Secure • Private",
            style: TextStyle(
              fontSize: _titleFontSize(context: context),
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: .15.sw),
            child: Text(
              "A Contactless, AI driven way to pay. No waiting on bills or checks, your transaction is automatically paid through the Nova app. Nova Pay keeps your transactions secure and private, never selling your data.",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
                fontSize: _bodyFontSize(context: context)
              ),
              textAlign: TextAlign.center,
            )
          ),
          SizedBox(height: 60.h),
          PaymentFeature(mainScrollKey: _mainScrollKey),
          SizedBox(height: 60.h),
          ShowBillFeatures(mainScrollKey: _mainScrollKey),
          SizedBox(height: 60.h),
          ReceiptFeature(mainScrollKey: _mainScrollKey),
          SizedBox(height: 30.h)
        ],
      ),
    );
  }

  double _titleFontSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 90.sp;
    }
    return 65.sp;
  }

  double _bodyFontSize({required BuildContext context}) {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 50.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return 40.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 30.sp; 
    }
    return 40.sp;
  }
}