import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Platform Widgets
import 'package:flutter_playground/platform_widgets/platform.dart';
import 'package:flutter_playground/platform_widgets/platform_app.dart';
import 'package:flutter_playground/platform_widgets/platform_appbar.dart';
import 'package:flutter_playground/platform_widgets/platform_backbutton.dart';
import 'package:flutter_playground/platform_widgets/platform_button.dart';
import 'package:flutter_playground/platform_widgets/platform_closebutton.dart';
import 'package:flutter_playground/platform_widgets/platform_iconbutton.dart';
import 'package:flutter_playground/platform_widgets/platform_routing.dart';
import 'package:flutter_playground/platform_widgets/platform_scaffold.dart';
import 'package:flutter_playground/platform_widgets/platform_switch.dart';

class PlatformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Platform Example',
      home: PlatformHomepage(),
    );
  }
}

class PlatformHomepage extends StatefulWidget {
  @override
  _PlatformHomepageState createState() => _PlatformHomepageState();
}

class _PlatformHomepageState extends State<PlatformHomepage> {
  int _currentPage = 0;

  // Build AppBar Title
  Widget _buildAppBarTitle(BuildContext context, String title) {
    return Text(
      '$title'.toUpperCase(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // AppBar List
    List<PlatformAppBar> _appBar = [
      PlatformAppBar(
        title: _buildAppBarTitle(context, 'Home'),
        actions: <Widget>[
          PlatformIconButton(
            onPressed: () {
              print('Search pressed');
            },
            iconData: Icons.search,
            tooltip: 'Search',
          ),
        ],
      ),
      PlatformAppBar(
        title: _buildAppBarTitle(context, 'Support'),
        actions: <Widget>[
          PlatformIconButton(
            onPressed: () {
              print('Menu pressed');
            },
            iconData: Icons.more_horiz,
            tooltip: 'Menu',
          ),
        ],
      ),
      PlatformAppBar(
        title: _buildAppBarTitle(context, 'Profile'),
        actions: <Widget>[
          PlatformIconButton(
            onPressed: () {
              print('Settings pressed');
            },
            iconData: Icons.settings,
            tooltip: 'Settings',
          ),
        ],
      ),
    ];

    // Body
    List<Widget> _body = [
      Page1(),
      Page2(),
      Page3(),
    ];

    // Navigation Bar Items
    List<BottomNavigationBarItem> _bottomNavBarItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_outline),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        title: Text('Profile'),
      ),
    ];

    if (isIos) {
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            currentIndex: _currentPage,
            iconSize: 24.0,
            backgroundColor: Colors.white,
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            items: _bottomNavBarItems,
            onTap: (int i) {
              _currentPage = i;
            },
          ),
          tabBuilder: (BuildContext context, int i) {
            switch (i) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) => PlatformScaffold(
                        appBar: _appBar[i],
                        body: _body[i],
                      ),
                  defaultTitle: 'Home',
                );
                break;
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) => PlatformScaffold(
                        appBar: _appBar[i],
                        body: _body[i],
                      ),
                  defaultTitle: 'Support',
                );
                break;
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) => PlatformScaffold(
                        appBar: _appBar[i],
                        body: _body[i],
                      ),
                  defaultTitle: 'Profile',
                );
                break;
            }
          });
    } else if (isAndroid) {
      return PlatformScaffold(
        appBar: _appBar[_currentPage],
        body: _body[_currentPage],
        android: (_) => MaterialScaffoldData(
              bottomNavBar: BottomNavigationBar(
                currentIndex: _currentPage,
                iconSize: 24.0,
                items: _bottomNavBarItems,
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.black,
                onTap: (int i) {
                  setState(() {
                    _currentPage = i;
                  });
                },
              ),
            ),
      );
    }

    return throw new UnsupportedError('This platform is not supported.');
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home'),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlatformButton(
        child: Text('Go to Fullscreen'),
        onPressed: () {
          Navigator.push(
              context,
              platformPageRoute(
                  fullscreenDialog: true, builder: (context) => SupportScreen()));
        },
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlatformButton(
        child: Text('Go to Profile Screen'),
        onPressed: () {
          Navigator.push(
              context,
              platformPageRoute(builder: (context) => ProfileScreen()));
        },
      ),
    );
  }
}

class SupportScreen extends StatefulWidget {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        leading: PlatformCloseButton(
          onPressed: () { Navigator.pop(context); },
        ),
        title: Text(
          'Support Fullscreen',
        ),
      ),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        leading: PlatformBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile Screen',
        ),
        ios: (_)=> CupertinoAppBarData(
          padding: EdgeInsetsDirectional.only(start: 0.0),
        )
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text('Notifications'),
            ),
            PlatformSwitch(
              value: _notifications,
              onChanged: (bool value) {
                setState(() {
                  _notifications = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

