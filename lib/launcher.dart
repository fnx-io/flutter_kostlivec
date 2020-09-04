import 'package:flutter/material.dart';
import 'package:flutter_kostlivec/src/app.dart';
import 'package:flutter_kostlivec/src/app_mode.dart';
import 'package:flutter_kostlivec/src/service/lifecycle_service.dart';

///
/// Nastartuje aplikaci v TEST nebo PROD modu
///
Future launch(AppMode mode) async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget app = await LifecycleService.configureApp(mode, App());

  runApp(app);
}
