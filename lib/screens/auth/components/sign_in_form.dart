import 'package:chat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../components/primary_button.dart';
import '../../../constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            decoration: const InputDecoration(hintText: 'Username'),
            onSaved: (username) {
              // Save it
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: RequiredValidator(errorText: "Password is required"),
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
              onSaved: (passaword) {
                // Save it
              },
            ),
          ),
          PrimaryButton(
            text: 'Sign in',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessagesScreen(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
