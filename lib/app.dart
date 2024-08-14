import 'package:flutter/material.dart';
import 'package:only_fans/core/architecture/navigator.dart';
import 'package:only_fans/core/architecture/screen.dart';
import 'package:only_fans/core/architecture/screens.dart';
import 'package:only_fans/core/inject/container_injector.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class VipFansApp extends StatefulWidget {
  const VipFansApp({super.key});

  @override
  State<VipFansApp> createState() => _VipFansAppState();
}

class _VipFansAppState extends State<VipFansApp> {
  @override
  void initState() {
    for (Screen screen in screens) {
      screen.injector?.dependencies();
    }

    super.initState();
  }

  Future<bool> onInit() async {
    ContainerInjectorImpl()
        .injectLazySingleton<NavigatorService>(() => NavigatorServiceImpl());

    return true;
  }

  Map<String, Screen> get screensMap => screens.asMap().map(
        (key, value) => MapEntry(value.name, value),
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: onInit(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        return MaterialApp(
          onUnknownRoute: onUnknowRoute,
          onGenerateRoute: onGenerateRoute,
          navigatorKey: NavigatorService.key,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
          ],
        );
      },
    );
  }

  Route<dynamic>? onUnknowRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => Container());
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final screen = screensMap[settings.name];

    if (screen == null) {
      return null;
    }

    return MaterialPageRoute(
        builder: (context) => screen.page(context),
        settings:
            RouteSettings(name: screen.name, arguments: settings.arguments));
  }
}
