import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';

abstract class _BaseData {
  _BaseData({
    this.navigatorKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final RouteFactory onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder builder;
  final String title;
  final GenerateAppTitle onGenerateTitle;
  final Color color;
  final Locale locale;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final LocaleListResolutionCallback localeListResolutionCallback;
  final LocaleResolutionCallback localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
}

class MaterialAppData extends _BaseData {
  MaterialAppData({
    GlobalKey<NavigatorState> navigatorKey,
    Widget home,
    Map<String, WidgetBuilder> routes,
    String initialRoute,
    RouteFactory onGenerateRoute,
    RouteFactory onUnknownRoute,
    List<NavigatorObserver> navigatorObservers,
    TransitionBuilder builder,
    String title,
    GenerateAppTitle onGenerateTitle,
    Color color,
    Locale locale,
    Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    LocaleListResolutionCallback localeListResolutionCallback,
    LocaleResolutionCallback localeResolutionCallback,
    Iterable<Locale> supportedLocales,
    bool showPerformanceOverlay,
    bool checkerboardRasterCacheImages,
    bool checkerboardOffscreenLayers,
    bool showSemanticsDebugger,
    bool debugShowCheckedModeBanner,
    this.theme,
    this.debugShowMaterialGrid,
  }) : super(
            navigatorKey: navigatorKey,
            home: home,
            routes: routes,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onUnknownRoute: onUnknownRoute,
            navigatorObservers: navigatorObservers,
            builder: builder,
            title: title,
            onGenerateTitle: onGenerateTitle,
            color: color,
            locale: locale,
            localizationsDelegates: localizationsDelegates,
            localeListResolutionCallback: localeListResolutionCallback,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner);

  final ThemeData theme;
  final bool debugShowMaterialGrid;
}

class CupertinoAppData extends _BaseData {
  CupertinoAppData({
    GlobalKey<NavigatorState> navigatorKey,
    Widget home,
    Map<String, WidgetBuilder> routes,
    String initialRoute,
    RouteFactory onGenerateRoute,
    RouteFactory onUnknownRoute,
    List<NavigatorObserver> navigatorObservers,
    TransitionBuilder builder,
    String title,
    GenerateAppTitle onGenerateTitle,
    Color color,
    Locale locale,
    Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    LocaleListResolutionCallback localeListResolutionCallback,
    LocaleResolutionCallback localeResolutionCallback,
    Iterable<Locale> supportedLocales,
    bool showPerformanceOverlay,
    bool checkerboardRasterCacheImages,
    bool checkerboardOffscreenLayers,
    bool showSemanticsDebugger,
    bool debugShowCheckedModeBanner,
    this.theme,
  }) : super(
            navigatorKey: navigatorKey,
            home: home,
            routes: routes,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onUnknownRoute: onUnknownRoute,
            navigatorObservers: navigatorObservers,
            builder: builder,
            title: title,
            onGenerateTitle: onGenerateTitle,
            color: color,
            locale: locale,
            localizationsDelegates: localizationsDelegates,
            localeListResolutionCallback: localeListResolutionCallback,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner);

  final CupertinoThemeData theme;
}

class PlatformApp extends PlatformWidget<CupertinoApp, MaterialApp> {
  PlatformApp({
    Key key,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.android,
    this.ios,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final RouteFactory onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder builder;
  final String title;
  final GenerateAppTitle onGenerateTitle;
  final Color color;
  final Locale locale;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final LocaleListResolutionCallback localeListResolutionCallback;
  final LocaleResolutionCallback localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;

  final PlatformBuilder<MaterialAppData> android;
  final PlatformBuilder<CupertinoAppData> ios;

  @override
  buildCupertinoWidget(BuildContext context) {
    CupertinoAppData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoApp(
      navigatorKey: data?.navigatorKey ?? navigatorKey,
      home: data?.home ?? home,
      routes: data?.routes ?? routes,
      initialRoute: data?.initialRoute ?? initialRoute,
      onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
      onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
      navigatorObservers: data?.navigatorObservers ?? navigatorObservers,
      builder: data?.builder ?? builder,
      title: data?.title ?? title,
      onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
      color: data?.color ?? color,
      locale: data?.locale ?? locale,
      localizationsDelegates:
          data?.localizationsDelegates ?? localizationsDelegates,
      localeListResolutionCallback:
          data?.localeListResolutionCallback ?? localeListResolutionCallback,
      localeResolutionCallback:
          data?.localeResolutionCallback ?? localeResolutionCallback,
      supportedLocales: data?.supportedLocales ?? supportedLocales,
      showPerformanceOverlay:
          data?.showPerformanceOverlay ?? showPerformanceOverlay,
      checkerboardRasterCacheImages:
          data?.checkerboardRasterCacheImages ?? checkerboardRasterCacheImages,
      checkerboardOffscreenLayers:
          data?.checkerboardOffscreenLayers ?? checkerboardOffscreenLayers,
      showSemanticsDebugger:
          data?.showSemanticsDebugger ?? showSemanticsDebugger,
      debugShowCheckedModeBanner:
          data?.debugShowCheckedModeBanner ?? debugShowCheckedModeBanner,
      theme: data?.theme,
    );
  }

  @override
  buildAndroidWidget(BuildContext context) {
    MaterialAppData data;
    if (android != null) {
      data = android(context);
    }

    return MaterialApp(
        navigatorKey: data?.navigatorKey ?? navigatorKey,
        home: data?.home ?? home,
        routes: data?.routes ?? routes,
        initialRoute: data?.initialRoute ?? initialRoute,
        onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
        onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
        navigatorObservers: data?.navigatorObservers ?? navigatorObservers,
        builder: data?.builder ?? builder,
        title: data?.title ?? title,
        onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
        color: data?.color ?? color,
        locale: data?.locale ?? locale,
        localizationsDelegates:
            data?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            data?.localeListResolutionCallback ?? localeListResolutionCallback,
        localeResolutionCallback:
            data?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: data?.supportedLocales ?? supportedLocales,
        showPerformanceOverlay:
            data?.showPerformanceOverlay ?? showPerformanceOverlay,
        checkerboardRasterCacheImages: data?.checkerboardRasterCacheImages ??
            checkerboardRasterCacheImages,
        checkerboardOffscreenLayers:
            data?.checkerboardOffscreenLayers ?? checkerboardOffscreenLayers,
        showSemanticsDebugger:
            data?.showSemanticsDebugger ?? showSemanticsDebugger,
        debugShowCheckedModeBanner:
            data?.debugShowCheckedModeBanner ?? debugShowCheckedModeBanner,
        theme: data?.theme,
        debugShowMaterialGrid: data?.debugShowMaterialGrid ?? false);
  }
}
