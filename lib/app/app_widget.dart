import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jogo da Velha',
      theme: ThemeData(primaryColor: Colors.blueAccent[800]),
      initialRoute: "/",
      builder: (context, widget) => ResponsiveWrapper.builder(BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 500,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP)
          ],
          background: Container(
            color: Colors.blueGrey[600],
          )),
    ).modular();
  }
}
