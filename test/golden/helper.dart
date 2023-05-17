import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:spacex/widgets/layout/loading.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:file/local.dart';

class MockCacheManager extends Mock implements DefaultCacheManager {
  static const fileSystem = LocalFileSystem();

  @override
  Stream<FileResponse> getImageFile(
      String url, {
        String? key,
        Map<String, String>? headers,
        bool withProgress = false,
        int? maxHeight,
        int? maxWidth,
      }) async* {
    yield FileInfo(
      fileSystem
          .file('assets/images/space_image.jpeg'), // Return your image file path
      FileSource.Cache,
      DateTime(2050),
      url,
    );
  }
}

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
      fontFamily: 'aBeeZee',
      textTheme: const TextTheme(
          bodySmall: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white)));
}

class GolderHelper {
  static MaterialApp getMaterialApp({required Widget child}) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
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
      home: child,
    );
  }
}