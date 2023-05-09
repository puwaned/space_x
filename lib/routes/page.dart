import 'package:flutter/material.dart';
import 'package:spacex/routes/path.dart';
import 'package:spacex/launch/view/screen.dart';
import 'package:spacex/splash/screen.dart';

class AppPages {
  AppPages._();

  static Map<String, WidgetBuilder> getPages(RouteSettings settings) => {
        AppPaths.splash: (ctx) => SplashScreen(),
        AppPaths.home: (ctx) => HomeScreen()
      };
}
