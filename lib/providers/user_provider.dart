import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:chat/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final _userRepositiry = UserRepository();

  bool _isLoading = false;
  AuthUser? _currentUser;

  bool get isLoading => _isLoading;
  AuthUser? get currentUser => _currentUser;

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Either<String, SignUpResult>> signUp(
      String username, String password, String email) async {
    _setIsLoading(true);
    final response = await _userRepositiry.signUp(username, email, password);
    _setIsLoading(false);
    return response;
  }

  Future<Either<String, bool>> confirmSignUp(
      {required String username, required String code}) async {
    _setIsLoading(true);
    final response = await _userRepositiry.confirmSignUp(
      username: username,
      code: code,
    );
    _setIsLoading(false);
    return response;
  }

  Future<Either<String, SignInResult>> signIn(
      {required String username, required String password}) async {
    _setIsLoading(true);
    final response = await _userRepositiry.signIn(
      username: username,
      password: password,
    );
    _setIsLoading(false);
    return response;
  }

  Future<AuthUser?> checkedLogedInUser() async {
    final authSession = await _userRepositiry.isUserLogedIn();

    if (authSession.isSignedIn) {
      _currentUser = await _userRepositiry.getCurrentUser();
      return _currentUser;
    }
    return null;
  }
}
