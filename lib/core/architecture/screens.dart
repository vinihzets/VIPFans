import 'package:only_fans/core/architecture/screen.dart';
import 'package:only_fans/features/login/presentation/login_injector.dart';
import 'package:only_fans/features/login/presentation/ui/login_view.dart';
import 'package:only_fans/features/register/presentation/ui/register_view.dart';
import 'package:only_fans/features/register/register_injector.dart';

List<Screen<dynamic>> screens = [
  Screen(
      name: '/login',
      page: (context) => const LoginView(),
      injector: LoginInjector()),
  Screen(
      name: '/register',
      page: (context) => const RegisterView(),
      injector: RegisterInjector()),
];
