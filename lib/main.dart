import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'package:flutter_playground/homepage.dart';
import 'package:flutter_playground/platform_homepage.dart';


void main() => runApp(PlatformPage());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Playground Home'),
    );
  }
}