import 'package:customer_web/routing/route_data.dart';
import 'package:customer_web/routing/routes.dart';
import 'package:customer_web/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route goTo({required BuildContext context, required RouteSettings settings}) {
    final RouteData routeData = RouteData.init(settings: settings);

    Route route;

    switch (routeData.route) {
      case Routes.app:
        route = _createRouteDefault(screen: HomeScreen(), name: routeData.route);
        break;
      default:
        route = _createRouteDefault(screen: HomeScreen(), name: '/');
    }

    return route;
  }

  MaterialPageRoute _createRouteDefault({required Widget screen, required String name}) {
    return MaterialPageRoute(
      builder: (_) => screen,
      settings: RouteSettings(name: name)
    );
  }
}