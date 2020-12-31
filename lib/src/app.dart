import 'package:flutter/material.dart';
import 'package:flutter_kostlivec/src/screen/edit_item_screen.dart';
import 'package:flutter_kostlivec/src/screen/home_screen.dart';
import 'package:flutter_kostlivec/src/theme.dart';

class App extends StatelessWidget {
  final applicationRoutes = {
    "/": (context) => HomeScreen(title: 'Flutter Demo Home Page'),
    "/edit": (context) => EditItemScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildTheme(),
      initialRoute: "/",
      routes: applicationRoutes,
    );
  }
}
