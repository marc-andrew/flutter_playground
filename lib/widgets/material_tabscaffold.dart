import 'package:flutter/material.dart';

class MaterialTabScaffold extends StatefulWidget {
  const MaterialTabScaffold({
    Key key,
    @required this.tabBuilder,
    @required this.bottomNavigationBar,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomPadding = true,
    this.primary = true,
  })  : assert(bottomNavigationBar != null),
        assert(tabBuilder != null),
        assert(primary != null),
        super(key: key);

  final IndexedWidgetBuilder tabBuilder;
  final BottomNavigationBar bottomNavigationBar;
  final PreferredSizeWidget appBar;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final List<Widget> persistentFooterButtons;
  final Widget drawer;
  final Widget endDrawer;
  final Color backgroundColor;
  final Widget bottomSheet;
  final bool resizeToAvoidBottomPadding;
  final bool primary;

  @override
  _MaterialTabScaffoldState createState() => _MaterialTabScaffoldState();
}

class _MaterialTabScaffoldState extends State<MaterialTabScaffold> {
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.bottomNavigationBar.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = _TabSwitchingView(
      currentTabIndex: _currentPage,
      tabNumber: widget.bottomNavigationBar.items.length,
      tabBuilder: widget.tabBuilder,
    );

    return Scaffold(
      appBar: widget.appBar,
      body: content,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      persistentFooterButtons: widget.persistentFooterButtons,
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      bottomSheet: widget.bottomSheet,
      backgroundColor: widget.backgroundColor,
      resizeToAvoidBottomPadding: widget.resizeToAvoidBottomPadding,
      primary: widget.primary,
    );
  }
}

class _TabSwitchingView extends StatefulWidget {
  const _TabSwitchingView({
    @required this.currentTabIndex,
    @required this.tabNumber,
    @required this.tabBuilder,
  }) : assert(currentTabIndex != null),
        assert(tabNumber != null && tabNumber > 0),
        assert(tabBuilder != null);

  final int currentTabIndex;
  final int tabNumber;
  final IndexedWidgetBuilder tabBuilder;

  @override
  _TabSwitchingViewState createState() => _TabSwitchingViewState();
}

class _TabSwitchingViewState extends State<_TabSwitchingView> {
  List<Widget> tabs;
  List<FocusScopeNode> tabFocusNodes;

  @override
  void initState() {
    super.initState();
    tabs = List<Widget>(widget.tabNumber);
    tabFocusNodes = List<FocusScopeNode>.generate(
      widget.tabNumber,
          (int index) => FocusScopeNode(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _focusActiveTab();
  }

  @override
  void didUpdateWidget(_TabSwitchingView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _focusActiveTab();
  }

  void _focusActiveTab() {
    FocusScope.of(context).setFirstFocus(tabFocusNodes[widget.currentTabIndex]);
  }

  @override
  void dispose() {
    for (FocusScopeNode focusScopeNode in tabFocusNodes) {
      focusScopeNode.detach();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: List<Widget>.generate(widget.tabNumber, (int index) {
        final bool active = index == widget.currentTabIndex;

        if (active || tabs[index] != null) {
          tabs[index] = widget.tabBuilder(context, index);
        }

        return Offstage(
          offstage: !active,
          child: TickerMode(
            enabled: active,
            child: FocusScope(
              node: tabFocusNodes[index],
              child: tabs[index] ?? Container(),
            ),
          ),
        );
      }),
    );
  }
}
