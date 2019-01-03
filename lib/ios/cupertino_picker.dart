/// This example will show you how to build
/// two CupertinoPicker next to each other.
/// You can also increase it by three or four.
/// If you are looking for a Date picker or
/// a Time picker please check Flutter's site
/// https://flutter.io/docs/development/ui/widgets/cupertino
///
/// However, if you are thinking to build a custom
/// picker you can see below how to archive it.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// The height for the bottom picker sheet
const double _kPickerSheetHeight = 216.0;

class CupertinoPickerScreen extends StatefulWidget {
  @override
  _CupertinoPickerScreenScreenState createState() =>
      _CupertinoPickerScreenScreenState();
}

class _CupertinoPickerScreenScreenState extends State<CupertinoPickerScreen> {
  // Initial controller
  final FixedExtentScrollController _controllerA =
      FixedExtentScrollController(initialItem: 0);
  final FixedExtentScrollController _controllerB =
      FixedExtentScrollController(initialItem: 0);

  // Open CupertinoPicker on button pressed
  void _onButtonPressed() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: _kPickerSheetHeight,
          padding: EdgeInsets.only(top: 6.0),
          color: Colors.white,
          child: DefaultTextStyle(
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
            ),
            child: GestureDetector(
              // Blocks taps from propagating to the modal sheet and popping.
              onTap: () {},
              child: SafeArea(
                top: false,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 32.0,
                        backgroundColor: CupertinoColors.white,
                        scrollController: _controllerA,
                        onSelectedItemChanged: (int index) {
                          print('A $index');
                        },
                        children: List<Widget>.generate(10, (int index) {
                          return Center(
                            child: Text('A $index'),
                          );
                        }),
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 32.0,
                        backgroundColor: CupertinoColors.white,
                        scrollController: _controllerB,
                        onSelectedItemChanged: (int index) {
                          print('B $index');
                        },
                        children: List<Widget>.generate(10, (int index) {
                          return Center(
                            child: Text('B $index'),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text('Cupertino Picker'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text('Open'),
          onPressed: _onButtonPressed),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }
}
