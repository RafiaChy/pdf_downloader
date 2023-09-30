import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_downloader/app_environments/app_environments.dart';
import 'package:pdf_downloader/app_environments/app_information.dart';

import 'common/route_manager.dart';

void mainDelegateForEnvironments() {
  runApp( RootApp());
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class RootApp extends StatefulWidget {
  const RootApp._internal();

  static const RootApp instance = RootApp._internal();

  factory RootApp() => instance;

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Brightness.dark
    // ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splashRoute,
      onGenerateRoute: RouteGenerator.getRoute,
      title: AppEnvironments.appName,
      navigatorKey: navigatorKey,

    );
  }
}

