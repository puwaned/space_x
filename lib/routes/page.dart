import 'package:flutter/material.dart';
import 'package:spacex/presentation/launch_detail/view/screen.dart';
import 'package:spacex/routes/path.dart';
import 'package:spacex/presentation/launch/view/screen.dart';
import 'package:spacex/splash/screen.dart';

class AppPages {
  AppPages._();

  static Map<String, WidgetBuilder> getPages(RouteSettings settings) => {
        AppPaths.splash: (ctx) => SplashScreen(),
        AppPaths.launch: (ctx) => LaunchScreen(),
        AppPaths.launchDetail: (ctx) => LaunchDetailScreen()
      };
}
