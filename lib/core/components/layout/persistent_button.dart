import 'package:flutter/material.dart';
import 'package:only_fans/core/core.dart';

class FilledPersistentButton extends StatelessWidget {
  final BloC bloc;
  final Icon? icon;
  final ButtonStyle? style;

  final Function()? onPressed;
  final Widget onIdle;

  final Widget? onPersisting;

  /// Se não setado, se acontecer erro, retorna o onIdle
  final Widget? onError;

  const FilledPersistentButton({
    required this.bloc,
    required this.onPressed,
    required this.onIdle,
    this.onPersisting,
    this.icon,
    this.style,
    this.onError,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ScreenState>(
      stream: bloc.state,
      builder: (context, snapshot) {
        return icon == null || snapshot.data?.data == Loading
            ? FilledButton(
                style: style,
                onPressed: onPressed,
                child: _getContent(snapshot.data),
              )
            : FilledButton.icon(
                style: style,
                icon: icon!,
                onPressed: onPressed,
                label: _getContent(snapshot.data),
              );
      },
    );
  }

  Widget _getContent(ScreenState? state) {
    final type = state.runtimeType;

    if (type == IError) {
      return onError ?? onIdle;
    }
    if (type == Loading) {
      return onPersisting ??
          const Center(
            child: CircularProgressIndicator.adaptive(),
          );
    }
    return onIdle;
  }
}
