import 'package:flutter/material.dart';
import 'components/logo_with_title.dart';
import 'components/otp_form.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
          OtpForm(),
        ],
      ),
    );
  }
}
