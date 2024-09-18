import 'package:morphling/morphling.dart';
import 'features/home/home_injector.dart';
import 'features/home/presentation/view/home_view.dart';
import 'features/login/login_injector.dart';
import 'features/login/screens/login_view.dart';
import 'features/register/register_injector.dart';

import 'features/register/screens/register_view.dart';

List<Screen<dynamic>> screens = [
  Screen(
      name: '/login',
      page: (context) => const LoginView(),
      injector: LoginInjector()),
  Screen(
      name: '/register',
      page: (context) => const RegisterView(),
      injector: RegisterInjector()),
  Screen(
      name: '/home',
      page: (context) => const HomeView(),
      injector: HomeInjector()),
];
