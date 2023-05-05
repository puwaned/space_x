import 'package:flutter/material.dart';

class AppPageTransitionBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  @override
  final RouteSettings settings;

  AppPageTransitionBuilder({
    required this.builder,
    required this.settings,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = Curves.ease;
            var tween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
          settings: settings,
        );
}
