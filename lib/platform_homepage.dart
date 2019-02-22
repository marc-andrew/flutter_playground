import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/platform_widgets/platform_appbar.dart';
import 'package:flutter_playground/platform_widgets/platform_button.dart';
import 'package:flutter_playground/platform_widgets/platform_navbar.dart';
import 'package:flutter_playground/platform_widgets/platform_scaffold.dart';

class PlatformHomepage extends StatefulWidget {
  @override
  _PlatformHomepageState createState() => _PlatformHomepageState();
}

class _PlatformHomepageState extends State<PlatformHomepage> {
  int _currentIndex = 0;

  void _onNavPressed(int index) {
//    setState(() {
//      _currentIndex = index;
//    });

    print('Pressed');
  }

  Widget _buildBody(BuildContext context) {
    switch(_currentIndex) {
      case 1:
        return Page2();
        break;
      case 2:
        return Page3();
        break;
      default:
        return Page1();
    }
  }

  @override
  Widget build(BuildContext context) {
//    return PlatformScaffold(
////      body: _buildBody(context),
//      ios: (_)=> CupertinoPageScaffoldData(
//        tabBuilder: (BuildContext context, int index) {
//          switch(index) {
//            case 1:
//              return Page2();
//              break;
//            case 2:
//              return Page3();
//              break;
//            default:
//              return Page1();
//          }
//        }
//      ),
//      bottomNavBar: PlatformNavBar(
//        onTap: _onNavPressed,
//        currentIndex: _currentIndex,
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(CupertinoIcons.home),
//            title: Text('Home'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(CupertinoIcons.conversation_bubble),
//            title: Text('Support'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(CupertinoIcons.profile_circled),
//            title: Text('Profile'),
//          ),
//        ],
//      ),
//    );
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
              builder: (BuildContext context) => Page1(),
              defaultTitle: 'Colors',
            );
            break;
          case 1:
            return CupertinoTabView(
              builder: (BuildContext context) => Page2(),
              defaultTitle: 'Support Chat',
            );
            break;
          case 2:
            return CupertinoTabView(
              builder: (BuildContext context) => Page3(),
              defaultTitle: 'Account',
            );
            break;
        }
        return null;
      },
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('home'),
      ),
      body: Center(
        child: PlatformButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: false).push(
                CupertinoPageRoute<bool>(
                    fullscreenDialog: false,
                    builder: (BuildContext context) => ChatScreen()));
          },
          child: Text('Open New Screen'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Support'),
//        ios: (_)=> CupertinoAppBarData(
//          transitionBetweenRoutes: false,
//        ),
      ),
      body: Center(
        child: PlatformButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: false).push(
                CupertinoPageRoute<bool>(
                    fullscreenDialog: false,
                    builder: (BuildContext context) => ChatScreen()));
          },
          child: Text('Open New Screen'),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Body'),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Text('Body'),
      ),
    );
  }
}
