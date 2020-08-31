import 'package:flutter/material.dart';
import 'package:flutter_kostlivec/src/app.dart';
import 'package:flutter_kostlivec/src/app_mode.dart';
import 'package:flutter_kostlivec/src/service/lifecycle_service.dart';

Future launch(AppMode mode) async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget app = LifecycleService.configureApp(mode, App());

  runApp(app);
}
