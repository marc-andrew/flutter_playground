import 'package:flutter/material.dart';

// Screens
import 'package:flutter_playground/ios/cupertino_picker.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text('Cupertino Picker Example'),
              onPressed: () {
                // Navigate to the new screen
                Navigator.push(
                  context,
                  MaterialPageRoute( builder: (context) => CupertinoPickerScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}