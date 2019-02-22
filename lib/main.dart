import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


//import 'package:flutter_playground/homepage.dart';
import 'package:flutter_playground/navigationbar/keep_navigationbar.dart';
import 'package:flutter_playground/platform_homepage.dart';
import 'package:flutter_playground/platform_widgets/platform_app.dart';
//import 'package:flutter_playground/home_navbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
      home: PlatformHomepage(),
//      home: MyHomePage(title: 'Flutter Playground Home'),
    );
  }
}