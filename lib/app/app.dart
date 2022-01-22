import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivpod/app/application/app_controller.dart';
import 'package:rivpod/screens/auth/initial_screen.dart';
import 'package:rivpod/screens/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Consumer(
        builder: (context, ref, child) {
          final appState = ref.read(appController);
          return appState.map(
              started: (_) => const _SplashView(),
              authenticated: (appInfo) {
                return const HomeScreen();
              },
              unauthenticated: (failure) {
                return const LoginScreen();
              });
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
