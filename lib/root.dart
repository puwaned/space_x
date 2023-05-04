import 'package:flutter/material.dart';
import 'package:spacex/routes/page.dart';
import 'package:spacex/routes/path.dart';
import 'package:spacex/widgets/layout/page_transition.dart';

class RootApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      builder: (context, child) {
        //
        return child!;
      },
      initialRoute: AppPaths.splash,
      onGenerateRoute: (settings) {
        final routes = AppPages.getPages(settings);
        final WidgetBuilder builder = routes[settings.name]!;
        return AppPageTransitionBuilder(builder: builder, settings: settings);
      },
    );
  }
}
