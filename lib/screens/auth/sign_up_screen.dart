import 'package:chat/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constants.dart';
import '../../components/primary_button.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              SizedBox(height: _size.height * 0.08),
              SvgPicture.asset(
                MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? logoDarkTheme
                    : logoLightTheme,
              ),
              SizedBox(height: _size.height * 0.08),
              Text(
                "Sign Up",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: _size.height * 0.05),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: RequiredValidator(errorText: requiredField),
                      decoration: InputDecoration(hintText: 'Full name'),
                      onSaved: (name) {
                        // Save it
                      },
                    ),
                    SizedBox(height: kDefaultPadding),
                    TextFormField(
                      validator: RequiredValidator(errorText: requiredField),
                      decoration: InputDecoration(hintText: 'Phone'),
                      keyboardType: TextInputType.phone,
                      onSaved: (phone) {
                        // Save it
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: TextFormField(
                        validator: RequiredValidator(errorText: requiredField),
                        decoration: InputDecoration(hintText: 'Password'),
                        obscureText: true,
                        onSaved: (passaword) {
                          // Save it
                        },
                      ),
                    ),
                    DropdownButtonFormField(
                      items: countries,
                      icon: Icon(Icons.expand_more),
                      onSaved: (country) {
                        // save it
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(hintText: 'Country'),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: PrimaryButton(
                        text: 'Sign in',
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      ),
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          children: [
                            TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.64),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// only for demo
List<DropdownMenuItem<String>>? countries = [
  "Bangladesh",
  "Switzerland",
  'Canada',
  'Japan',
  'Germany',
  'Australia',
  'Sweden',
].map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(value: value, child: Text(value));
}).toList();
