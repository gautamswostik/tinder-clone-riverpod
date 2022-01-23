import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivpod/application/auth/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final authentication = ref.read(authController.notifier);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('Google'),
                  onPressed: () {
                    authentication.signInWithGoogle();
                  },
                ),
                ElevatedButton(
                  child: const Text('Facebook'),
                  onPressed: () {
                    authentication.signInWithFacebook();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
