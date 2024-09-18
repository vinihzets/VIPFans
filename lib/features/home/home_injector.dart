import 'package:morphling/morphling.dart';
import 'package:vip_fans_instance_core/vip_fans_instance_core.dart';

class HomeInjector extends ContainerInjectorImpl with DependencyInjector {
  @override
  void dependencies() {
    putFactory(() => HomeBloc());
  }
}
