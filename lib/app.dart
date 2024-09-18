import 'package:morphling/morphling.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vip_fans/screens.dart';
import 'package:vip_fans_instance_core/vip_fans_instance_core.dart';

import 'core/theme/custom_theme_data.dart';

class VipFansApp extends StatefulWidget {
  const VipFansApp({super.key});

  @override
  State<VipFansApp> createState() => _VipFansAppState();
}

class _VipFansAppState extends State<VipFansApp> {
  @override
  void initState() {
    ServicesInjector().dependencies();

    ContainerInjectorImpl().find<AuthService>().initialize();
    ContainerInjectorImpl().find<DatabaseService>().initialize();

    for (Screen screen in screens) {
      screen.injector?.dependencies();
    }

    super.initState();
  }

  Future<bool> onInit() async {
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
          theme: CustomThemeData.lightTheme,
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: ThemeMode.system,
          onUnknownRoute: onUnknowRoute,
          onGenerateRoute: onGenerateRoute,
          navigatorKey: NavigatorService.key,
          initialRoute: '/login',
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
    return null;
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
