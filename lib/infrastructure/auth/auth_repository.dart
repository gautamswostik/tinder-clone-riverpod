import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivpod/app/app_info.dart';

final authRepository =
    Provider<IAuthRepository>((ref) => AuthRepository(ref.read));

abstract class IAuthRepository {
  Future<Either<AppInfo?, String>> appStarted();
  Future<Either<UserCredential, LogInWithGoogleFailure>> signInWithGoogle();
  Future<Either<UserCredential, String>> signInWithFaceBook();
  Future<User?> getCurrentUser();
  Future<Either<Unit, String>> signOut();
}

class AuthRepository implements IAuthRepository {
  AuthRepository(Reader read) : _read = read;

  final Reader _read;

  @override
  Future<Either<AppInfo?, String>> appStarted() async {
    try {
      final user = await getCurrentUser();
      if (user != null) {
        return const Left(AppInfo());
      } else {
        return const Right("No Current User");
      }
    } catch (e) {
      return const Right("No Current User");
    }
  }

  @override
  Future<Either<UserCredential, LogInWithGoogleFailure>>
      signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return Left(result);
    } on FirebaseAuthException catch (e) {
      return Right(LogInWithGoogleFailure.fromCode(e.code));
    } catch (_) {
      return const Right(LogInWithGoogleFailure());
    }
  }

  @override
  Future<Either<UserCredential, String>> signInWithFaceBook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebootAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      final result = await FirebaseAuth.instance
          .signInWithCredential(facebootAuthCredential);
      return Left(result);
    } catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<Either<Unit, String>> signOut() async {
    try {
      await Future.wait([
        FirebaseAuth.instance.signOut(),
        GoogleSignIn().signOut(),
        FacebookAuth.instance.logOut(),
      ]);
      return const Left(unit);
    } catch (e) {
      return Right(e.toString());
    }
  }
}

class LogInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  /// The associated error message.
  final String message;
}
