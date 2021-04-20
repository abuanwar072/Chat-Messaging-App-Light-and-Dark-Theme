import 'package:chat/components/primary_button.dart';
import 'package:chat/screens/auth/change_password_screen.dart';
import 'package:chat/screens/auth/components/logo_with_title.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constants.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogoWithTitle(
        title: 'Forgot Password',
        subText:
            "Integer quis dictum tellus, a auctorlorem. Cras in biandit leo suspendiss.",
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: RequiredValidator(errorText: requiredField),
                decoration: InputDecoration(hintText: 'Phone'),
                keyboardType: TextInputType.phone,
                onSaved: (phone) {
                  // Save it
                },
              ),
            ),
          ),
          PrimaryButton(
            text: 'Next',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordScreen(),
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
