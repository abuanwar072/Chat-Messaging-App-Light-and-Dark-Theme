import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
              // Save it
            },
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'Email'),
            onSaved: (email) {
              // Save it
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: RequiredValidator(errorText: "Password is required"),
              decoration: const InputDecoration(hintText: 'Password'),
              obscureText: true,
              onSaved: (passaword) {
                // Save it
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerificationScreen(),
                    ),
                  );
                }
              },
              child: const Text("Sign Up"),
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
