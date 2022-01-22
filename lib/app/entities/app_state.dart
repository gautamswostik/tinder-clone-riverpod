import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState<T> with _$AppState<T> {
  const factory AppState.started() = AppStarted<T>;

  const factory AppState.authenticated(T value) = AppAuthenticated<T>;

  const factory AppState.unauthenticated({T? failure}) =
      AppUnauthenticated<T>;
}
