import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const double _kPickerSheetHeight = 216.0;

class CupertinoPickerScreen extends StatefulWidget {
  @override
  _CupertinoPickerScreenScreenState createState() =>
      _CupertinoPickerScreenScreenState();
}

class _CupertinoPickerScreenScreenState extends State<CupertinoPickerScreen> {
  final FixedExtentScrollController _controllerA =
      FixedExtentScrollController(initialItem: 0);
  final FixedExtentScrollController _controllerB =
      FixedExtentScrollController(initialItem: 0);

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
