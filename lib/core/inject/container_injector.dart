import 'dart:developer';

import 'package:get_it/get_it.dart';

GetIt _instance = GetIt.asNewInstance();

abstract class ContainerInjector {
  T find<T extends Object>({String? instanceName});

  void injectFactory<T extends Object>(T Function() builder,
      {String? instanceName});

  void injectLazySingleton<T extends Object>(T Function() builder,
      {String? instanceName});
}

class ContainerInjectorImpl implements ContainerInjector {
  @override
  T find<T extends Object>({String? instanceName}) {
    return _instance.get<T>();
  }

  @override
  void injectFactory<T extends Object>(T Function() builder,
      {String? instanceName}) {
    if (_instance.isRegistered<T>(instanceName: instanceName)) {
      return;
    }

    _instance.registerFactory<T>(builder, instanceName: instanceName);
    log('Injector::injectFactory $T');
  }

  @override
  void injectLazySingleton<T extends Object>(T Function() builder,
      {String? instanceName}) {
    if (_instance.isRegistered(instance: T, instanceName: instanceName)) {
      return;
    }

    log('Injector::injectLazySingleton $T');

    _instance.registerLazySingleton<T>(builder, instanceName: instanceName);
  }
}
