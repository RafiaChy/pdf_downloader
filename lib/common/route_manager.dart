import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_downloader/features/02_Home/presentation/page/home_view.dart';

import '../features/01_Splash/presentation/page/splash_view.dart';

class RouteName {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
}
class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {

    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case RouteName.splashRoute:

        return MaterialPageRoute(builder: (_) =>  SplashView());
      case RouteName.homeRoute:

        return MaterialPageRoute(builder: (_) => const HomeView());


      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('PDF Downloader'),
          ),
          body: const Center(
            child: Text('No Route Found'),
          ),
        ));
  }
}