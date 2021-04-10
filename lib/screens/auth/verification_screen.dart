import 'package:chat/components/primary_button.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/logo_with_title.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogoWithTitle(
        title: 'Verification',
        subText: "SMS Verification code has been sent",
        children: [
          Text("+880 18577 11111"),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          // OTP Form
          Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: Theme.of(context).textTheme.headline5,
                    decoration: otpInputDecoration,
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                Expanded(
                  child: TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                    decoration: otpInputDecoration,
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                Expanded(
                  child: TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                    decoration: otpInputDecoration,
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                Expanded(
                  child: TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                    decoration: otpInputDecoration,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding * 1.5),
          PrimaryButton(
            text: "Next",
            press: () {},
          ),
        ],
      ),
    );
  }
}
