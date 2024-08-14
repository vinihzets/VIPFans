import 'dart:async';

import 'package:only_fans/core/architecture/event.dart';
import 'package:only_fans/core/architecture/navigator.dart';
import 'package:only_fans/core/architecture/screen_state.dart';
import 'package:only_fans/core/inject/container_injector.dart';
import 'package:only_fans/core/mixins/hud_mixins.dart';

abstract class BloC with HudMixins {
  late StreamController<ScreenState> _state;
  Stream<ScreenState> get state => _state.stream;

  late StreamController<IEvent> _event;
  Sink<IEvent> get event => _event.sink;
  late NavigatorService navigatorService;

  BloC() {
    navigatorService = ContainerInjectorImpl().find<NavigatorService>();

    _state = StreamController.broadcast();
    _event = StreamController.broadcast();
    _event.stream.listen(mapListenEvent);
  }

  dispatchEvent(IEvent event) => _event.add(event);

  dispatchState(ScreenState state) => _state.add(state);

  mapListenEvent(IEvent event);

  // Future<UserEntity?> handleAuthenticatited() async {
  //   final sessionUser = await sessionStorageService.fetchSession();

  //   if (sessionUser == null) {
  //     navigatorService.offAllNamed('/login');
  //   }

  //   user = sessionUser;
  //   return user;
  // }
}
