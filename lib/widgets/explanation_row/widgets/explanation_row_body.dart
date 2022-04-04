import 'package:customer_web/resources/responsive_layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../bloc/explanation_bloc.dart';
import 'widgets/explanation.dart';

class ExplanationRowBody extends StatelessWidget {
  final ResponsiveLayoutHelper _layoutHelper = const ResponsiveLayoutHelper();

  const ExplanationRowBody({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            _responsiveLayout(
              context: context,
              firstWidget: const Explanation(
                text: "AI payment monitoring protects you against fraud.",
                animationPath: ExplanationBloc.brainAnimation,
              ),
              secondWidget: const Explanation(
                text: "Safely pay with truly contactless transactions.",
                animationPath: ExplanationBloc.coinsAnimation,
              ),
            ),
            SizedBox(height: 30.h),
            _responsiveLayout(
              context: context,
              firstWidget: const Explanation(
                text: "No signing bills or scanning QR codes to pay.",
                animationPath: ExplanationBloc.invoiceAnimation,
              ),
              secondWidget: const Explanation(
                text: "Nova seamlessly pays when you leave the business.",
                animationPath: ExplanationBloc.rocketAnimation,
              ),
            ),
            SizedBox(height: 30.h)
          ],
        ),
      )
    );
  }

  Widget _responsiveLayout({required BuildContext context, required Widget firstWidget, required Widget secondWidget}) {
    return ResponsiveRowColumn(
      layout: _layoutHelper.setLayout(context: context, deviceSize: TABLET),
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      columnSpacing: 30.h,
      rowSpacing: 60.w,
      children: [
        ResponsiveRowColumnItem(
          rowFit: FlexFit.tight,
          child: firstWidget
        ),
        ResponsiveRowColumnItem(
          rowFit: FlexFit.tight,
          child: secondWidget
        )
      ],
    );
  }
}