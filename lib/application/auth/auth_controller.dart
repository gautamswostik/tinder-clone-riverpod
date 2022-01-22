import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivpod/app/app_info.dart';
import 'package:rivpod/app/application/app_controller.dart';
import 'package:rivpod/app/entities/app_state.dart';
import 'package:rivpod/application/core/base_state.dart';
import 'package:rivpod/infrastructure/auth/auth_repository.dart';

final authController = StateNotifierProvider.autoDispose((ref) {
  return AuthController<void>(
    ref.read,
  );
});

class AuthController<T> extends BaseNotifier<T> {
  AuthController(this._read) : super(state: const BaseState.initial());

  final Reader _read;

  IAuthRepository get _repo => _read(authRepository);
  AppStateNotifier get _appState => _read(appController.notifier);

  Future<void> signInWithGOogle() async {
    state = const BaseState.loading();

    final data = await _repo.signInWithGoodle();

    state = data.fold((user) {
      _appState.updateAppState(const AppState.authenticated(AppInfo()));
      return const BaseState.success();
    }, (r) => BaseState.error(r.message));
  }

  Future<void> signOut() async {
    state = const BaseState.loading();

    final data = await _repo.signOut();
    data.fold((_) {
      _appState.updateAppState(const AppState.unauthenticated());
    }, (r) {
      return BaseState.error(r);
    });
  }
}
