import 'package:morphling/morphling.dart';
import 'package:vip_fans_instance_core/vip_fans_instance_core.dart';
import 'states/states.dart';

class HomeView extends ScreenView<HomeBloc> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, HomeBloc bloc) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          actions: [
            const Icon(
              Icons.search,
            ),
            const Hspacer(),
            const Icon(Icons.message_outlined),
            const Hspacer(),
            GestureDetector(
              onTap: () => null,
              child: const CircleAvatar(
                child: Icon(Icons.person_2_outlined),
              ),
            )
          ],
        ),
        body: StateScreenBuilder(
            onStable: (c, s) => HomeViewStableState(
                  state: s,
                  bloc: bloc,
                ),
            onError: (c, s) => Container(),
            onEmpty: (c, s) => Container(),
            onLoading: (c, s) => Container(),
            stream: bloc.state));
  }
}
