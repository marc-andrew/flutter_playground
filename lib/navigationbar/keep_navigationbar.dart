import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class KeepNavigationBar extends StatefulWidget {
  @override
  _KeepNavigationBarState createState() => _KeepNavigationBarState();
}

class _KeepNavigationBarState extends State<KeepNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble),
            title: Text('Support'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            title: Text('Profile'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) => CupertinoDemoTab1(),
              defaultTitle: 'Colors',
            );
            break;
          case 1:
            return CupertinoTabView(
              builder: (BuildContext context) => CupertinoDemoTab2(),
              defaultTitle: 'Support Chat',
            );
            break;
          case 2:
            return CupertinoTabView(
              builder: (BuildContext context) => CupertinoDemoTab3(),
              defaultTitle: 'Account',
            );
            break;
        }
        return null;
      },
    );
  }
}

class CupertinoDemoTab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.only(start: 0.0),
        middle: Text('Home'),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text('New Page'),
          onPressed: () {
            Navigator.of(context, rootNavigator: false).push(
                CupertinoPageRoute<bool>(
                    fullscreenDialog: false,
                    builder: (BuildContext context) => NewScreen()));
          },
        ),
      ),
    );
  }
}

class CupertinoDemoTab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.only(start: 0.0),
        middle: Text('Chat Page'),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text('New Page'),
          onPressed: () {
            Navigator.of(context, rootNavigator: false).push(
                CupertinoPageRoute<bool>(
                    fullscreenDialog: false,
                    builder: (BuildContext context) => NewScreen()));
          },
        ),
      ),
    );
  }
}

class CupertinoDemoTab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.only(start: 0.0),
        middle: Text('Account Page'),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text('New Page'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                    fullscreenDialog: false,
                    builder: (BuildContext context) => NewScreen()));
          },
        ),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('New Page'),
      ),
      child: Center(
        child: Text(
          'New Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
