abstract class ScreenState<T> {
  final T? data;

  ScreenState({required this.data});
}

class Stable extends ScreenState {
  Stable({required super.data});
}

class Empty extends ScreenState {
  Empty({required super.data});
}

class IError extends ScreenState {
  IError({required super.data});
}

class Loading extends ScreenState {
  Loading({required super.data});
}
