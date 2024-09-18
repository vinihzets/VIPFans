import 'package:morphling/morphling.dart';

class CoreInjector extends ContainerInjectorImpl with DependencyInjector {
  final List<DependencyInjector> injectors = [];

  void inject(DependencyInjector injector) {
    injector.dependencies();
  }

  @override
  void dependencies() {
    for (DependencyInjector dependency in injectors) {
      inject(dependency);
    }
  }
}
