import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spacex/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  runApp(RootApp());
}