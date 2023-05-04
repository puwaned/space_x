import 'package:flutter/material.dart';
import 'package:spacex/routes/path.dart';
import 'package:spacex/screen/home/screen.dart';
import 'package:spacex/screen/splash/screen.dart';

class AppPages {
  AppPages._();

  static Map<String, WidgetBuilder> getPages(RouteSettings settings) => {
        AppPaths.splash: (ctx) => SplashScreen(),
        AppPaths.home: (ctx) => HomeScreen()
      };
}
