import 'package:flutter/material.dart';
import 'package:phone_auth_simple/phone_auth_simple.dart';

class GetOtp extends StatefulWidget {
  final String phoneNumber;
  GetOtp({this.phoneNumber});

  @override
  _GetOtpState createState() => _GetOtpState();
}

class _GetOtpState extends State<GetOtp> {
  @override
  Widget build(BuildContext context) {
    return PhoneAuthSimple(
      countryCode: "+91",
      phoneNumber: widget.phoneNumber,
      onVerificationSuccess: () {
        print("My Completed");
      },
      onVerificationFailure: () {
        print("My Failed");
      },
    );
  }
}