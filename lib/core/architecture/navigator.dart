import 'package:flutter/material.dart';

abstract class NavigatorService {
  static final GlobalKey<NavigatorState> key = GlobalKey();

  Future<T?>? toNamed<T>(
    String route, {
    dynamic arguments,
  });

  Future<T?>? offAllNamed<T>(
    String route, {
    dynamic arguments,
  });

  Future<T?>? popAndToNamed<T>(
    String route, {
    dynamic arguments,
    dynamic result,
  });

  Future<T?>? toRoute<T>(Widget route, String nameRoute);

  void pop<T>({
    T? result,
  });

  void setArguments(Object? args);
  dynamic getArguments();

  String getLastRoute();
  String getCurrentRoute();
}

class NavigatorServiceImpl implements NavigatorService {
  Object? arguments;

  String lastRoute = '/';
  String currentRoute = '/';

  BuildContext? get context => NavigatorService.key.currentContext;

  @override
  Future<T?>? toNamed<T>(
    String route, {
    dynamic arguments,
  }) {
    lastRoute = currentRoute;
    currentRoute = route;

    return NavigatorService.key.currentState
        ?.pushNamed(route, arguments: arguments);
  }

  createNoTransitionPage(Widget page, String route, Object? arguments) {
    return PageRouteBuilder(
        settings: RouteSettings(name: '/$route', arguments: arguments),
        pageBuilder: ((context, animation, secondaryAnimation) => page),
        transitionsBuilder: ((context, animation, secondaryAnimation, child) =>
            child));
  }

  @override
  Future<T?>? offAllNamed<T>(
    String route, {
    dynamic arguments,
  }) {
    lastRoute = currentRoute;
    currentRoute = route;

    return NavigatorService.key.currentState?.pushNamedAndRemoveUntil(
      route,
      (route) => false,
      arguments: arguments,
    );
  }

  @override
  Future<T?>? popAndToNamed<T>(
    String route, {
    dynamic arguments,
    dynamic result,
  }) {
    lastRoute = currentRoute;
    currentRoute = route;

    return NavigatorService.key.currentState?.popAndPushNamed(
      route,
      arguments: arguments,
      result: result,
    );
  }

  @override
  void pop<T>({
    T? result,
  }) {
    currentRoute = lastRoute;
    lastRoute = currentRoute;

    return NavigatorService.key.currentState?.pop(result);
  }

  @override
  String getCurrentRoute() {
    return currentRoute;
  }

  @override
  String getLastRoute() {
    return lastRoute;
  }

  @override
  Object? getArguments() {
    return arguments;
  }

  @visibleForTesting
  @override
  void setArguments(Object? args) {
    arguments = args;
  }

  @override
  Future<T?>? toRoute<T>(Widget route, String nameRoute,
      {Object? arguments}) async {
    return await NavigatorService.key.currentState
        ?.push(createNoTransitionPage(route, nameRoute, arguments));
  }
}
