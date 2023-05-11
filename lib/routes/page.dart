import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/presentation/launch/bloc/bloc.dart';
import 'package:spacex/presentation/launch_detail/view/screen.dart';
import 'package:spacex/presentation/launch_pad/bloc/bloc.dart';
import 'package:spacex/presentation/launch_pad/view/screen.dart';
import 'package:spacex/presentation/rocket/bloc/bloc.dart';
import 'package:spacex/repo/launch_repo.dart';
import 'package:spacex/repo/rocket_repo.dart';
import 'package:spacex/routes/path.dart';
import 'package:spacex/presentation/launch/view/screen.dart';
import 'package:spacex/splash/screen.dart';

import '../presentation/rocket/view/screen.dart';
import '../repo/launch_pad_repo.dart';

class AppPages {
  AppPages._();

  static Map<String, WidgetBuilder> getPages(RouteSettings settings) => {
        AppPaths.splash: (ctx) => const SplashScreen(),
        AppPaths.launch: (context) {
          var launchRepo = context.read<LaunchRepository>();
          return BlocProvider(
            create: (ctx) => LaunchBloc(launchRepo),
            child: const LaunchScreen(),
          );
        },
        AppPaths.launchDetail: (context) => LaunchDetailScreen(),
        AppPaths.launchPadDetail: (context) {
          var launchPadRepo = context.read<LaunchPadRepository>();
          var id = ModalRoute.of(context)?.settings.arguments as String;
          return BlocProvider(
            create: (ctx) => LaunchPadBloc(launchPadRepo, id),
            child: const LaunchPadScreen(),
          );
        },
        AppPaths.rocketDetail: (context) {
          var rocketRepo = context.read<RocketRepository>();
          return BlocProvider(
            create: (ctx) => RocketBloc(rocketRepo),
            child: const RocketDetailScreen(),
          );
        }
      };
}
