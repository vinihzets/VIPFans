import 'package:flutter/material.dart';
import 'package:only_fans/core/architecture/screen_state.dart';

class StateScreenBuilder extends StatelessWidget {
  final Stream<ScreenState> stream;
  final Widget Function(BuildContext, Stable) onStable;
  final Widget Function(BuildContext, IError) onError;
  final Widget Function(BuildContext, Empty) onEmpty;
  final Widget Function(BuildContext, Loading) onLoading;

  const StateScreenBuilder({
    required this.onStable,
    required this.onError,
    required this.onEmpty,
    required this.onLoading,
    required this.stream,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is Stable) {
          return onStable(context, state);
        } else if (state is Empty) {
          return onEmpty(context, state);
        } else if (state is Loading) {
          return onLoading(context, state);
        } else if (state is IError) {
          return onError(context, state);
        } else {
          return Container();
        }
      },
    );
  }
}
