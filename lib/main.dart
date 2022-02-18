import 'package:customer_web/routing/app_router.dart';
import 'package:customer_web/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'themes/main_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(990, 825),
      builder: () => MaterialApp(
        title: 'Nova Pay',
        initialRoute: Routes.app,
        onGenerateRoute: (settings) => _router.goTo(context: context, settings: settings),
        theme: MainTheme.themeData(context: context),
        builder: (context, widget) {
          return ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ]
          );
        },
      )
    );
  }
}