import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/core.dart';

import 'onboarding.dart';

void main() {
  SyncfusionLicense.registerLicense("NT8mJyc2IWhia31hfWN9Z2doa3xqfGFjYWNzZ2ljamlgZnMDHmg0Mj42IzI3ZWcTND4yOj99MDw+");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnboardingScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen();
  }
}
