import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.05),
                SvgPicture.asset(
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? logoDarkTheme
                      : logoLightTheme,
                  height: 100,
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Text(
                  "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                const SignUpForm(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
