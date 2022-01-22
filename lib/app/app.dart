import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivpod/app/application/app_controller.dart';
import 'package:rivpod/screens/auth/login_screen.dart';
import 'package:rivpod/screens/home.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final appState = ref.watch(appController);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: appState.map<Widget>(
        started: (_) => const _SplashView(),
        authenticated: (appInfo) {
          return const HomeScreen();
        },
        unauthenticated: (failure) {
          return const LoginScreen();
        },
      ),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
