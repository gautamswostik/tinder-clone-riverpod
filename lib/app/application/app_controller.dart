import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivpod/app/app_info.dart';
import 'package:rivpod/app/entities/app_state.dart';
import 'package:rivpod/infrastructure/auth/auth_repository.dart';

final appController =
    StateNotifierProvider<AppStateNotifier, AppState<AppInfo>>((ref) {
  return AppStateNotifier(ref.read)..appStarted();
});

class AppStateNotifier extends StateNotifier<AppState<AppInfo>> {
  AppStateNotifier(this._read) : super(const AppState.started());

  final Reader _read;

  IAuthRepository get _repo => _read(authRepository);

  Future<void> appStarted() async {
    final data = await _repo.appStarted();

    state = data.fold(
      (appInfo) {
        if (appInfo != null) {
          return AppState.authenticated(appInfo);
        }
        return const AppState.unauthenticated();
      },
      (failure) => const AppState.unauthenticated(),
    );
  }

  Future<void> unAunthenticated() async {
    await _repo.signOut();
    state = const AppState.unauthenticated();
  }

  void updateAppState(AppState<AppInfo> appState) {
    state = appState;
  }
}
