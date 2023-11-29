import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/news_list.dart';
import '../pages/news_single.dart';
import '../pages/splash.dart';

abstract class AppRoute {
  static Route<dynamic> router(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/news':
        return CupertinoPageRoute(
          builder: (_) => const NewsScreen(),
        );
      case '/news_single':
        return CupertinoPageRoute(
          builder: (_) =>  NewsSingleScreen(),
        );
      default:
        return CupertinoPageRoute(builder: (_) => const Scaffold());
    }
  }
}