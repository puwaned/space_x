import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spacex/dio_client.dart';
import 'package:spacex/repo/launch_pad_repo.dart';
import 'package:spacex/repo/launch_repo.dart';
import 'package:spacex/repo/rocket_repo.dart';
import 'package:spacex/root.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dio = DioClient.getDioClient();

  //hot fix k-bank certificate error
  HttpOverrides.global = MyHttpOverrides();

  runApp(RootApp(
    launchRepo: LaunchRepository(dio: dio),
    launchPadRepo: LaunchPadRepository(dio: dio),
    rocketRepo: RocketRepository(dio: dio),
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}