import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:spacex/repo/launch_pad_repo.dart';
import 'package:spacex/repo/launch_repo.dart';
import 'package:spacex/repo/rocket_repo.dart';
import 'package:spacex/routes/page.dart';
import 'package:spacex/routes/path.dart';
import 'package:spacex/widgets/layout/loading.dart';
import 'package:spacex/widgets/layout/page_transition.dart';

class RootApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final LaunchRepository launchRepo;
  final LaunchPadRepository launchPadRepo;
  final RocketRepository rocketRepo;

  RootApp(
      {super.key,
      required this.launchRepo,
      required this.launchPadRepo,
      required this.rocketRepo});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LaunchRepository>(create: (ctx) => launchRepo),
          RepositoryProvider<LaunchPadRepository>(
              create: (ctx) => launchPadRepo),
          RepositoryProvider<RocketRepository>(create: (ctx) => rocketRepo)
        ],
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: GoogleFonts.aBeeZeeTextTheme(const TextTheme(
                  bodySmall: TextStyle(color: Colors.white),
                  bodyMedium: TextStyle(color: Colors.white),
                  bodyLarge: TextStyle(color: Colors.white)))),
          builder: (context, child) {
            return ResponsiveBreakpoints.builder(
              child: AppLoadingScreen(child: child!),
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            );
          },
          initialRoute: AppPaths.splash,
          onGenerateRoute: (settings) {
            final routes = AppPages.getPages(settings);
            final WidgetBuilder builder = routes[settings.name]!;
            return AppPageTransitionBuilder(
                builder: builder, settings: settings);
          },
        ));
  }
}
