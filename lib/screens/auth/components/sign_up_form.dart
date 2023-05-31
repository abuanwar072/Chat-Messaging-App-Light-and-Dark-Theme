import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:chat/providers/user_provider.dart';
import 'package:chat/repositories/user_repository.dart';
import 'package:chat/shared/extentions.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../sign_in_screen.dart';
import '../verification_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _email, _password;

  void signUp(String username, String password, String email) async {
    final signUpResult =
        await context.read<UserProvider>().signUp(username, password, email);
    signUpResult.fold(
      (error) => context.showError(error),
      (step) {
        if (step.nextStep.signUpStep == AuthSignUpStep.confirmSignUp) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VerificationScreen(username: username),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'Username'),
            onSaved: (username) {
              _username = username!;
            },
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'Email'),
            onSaved: (email) {
              _email = email!;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: RequiredValidator(errorText: "Password is required"),
              decoration: const InputDecoration(hintText: 'Password'),
              obscureText: true,
              onSaved: (passaword) {
                _password = passaword!;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  signUp(_username, _password, _email);
                }
              },
              child: context.watch<UserProvider>().isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Sign Up"),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            ),
            child: Text.rich(
              TextSpan(
                text: "Already have an account? ",
                children: [
                  TextSpan(
                    text: "Sign in",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.64),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
