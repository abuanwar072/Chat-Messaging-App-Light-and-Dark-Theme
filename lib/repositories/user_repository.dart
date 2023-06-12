import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';

class UserRepository {
  Future<Either<String, SignUpResult>> signUp(
      String username, String email, String password) async {
    final Map<AuthUserAttributeKey, String> userAttributes = {
      AuthUserAttributeKey.email: email
    };

    try {
      final result = await Amplify.Auth.signUp(
        username: username,
        password: password,
        options: SignUpOptions(userAttributes: userAttributes),
      );
      return right(result);
    } on AuthException catch (e) {
      return left(e.message);
    }
  }

  Future<Either<String, bool>> confirmSignUp(
      {required String username, required String code}) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: code,
      );
      return right(result.isSignUpComplete);
    } on AuthException catch (e) {
      return left(e.message);
    }
  }

  Future<Either<String, SignInResult>> signIn(
      {required String username, required String password}) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );
      return right(result);
    } on AuthException catch (e) {
      return left(e.message);
    }
  }

  // Plan is to check is user loged in or not
  Future<AuthSession> isUserLogedIn() {
    return Amplify.Auth.fetchAuthSession();
  }

  // If user is loged in then fetch the user
  Future<AuthUser> getCurrentUser() {
    return Amplify.Auth.getCurrentUser();
  }

  // Last thing is to sign out the user
  // we can make it better
  Future<SignOutResult> signOut() {
    return Amplify.Auth.signOut();
  }
} 
