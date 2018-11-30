import 'package:flutter/material.dart';
import 'package:phone_auth_simple/phone_auth_simple.dart';
import './get_otp.dart';


class PhoneNumber extends StatelessWidget {

  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextFormField(
            onSaved: (number)=>phoneNumber=number,
          ),
          FlatButton(
            child: Text("Get OTP"),
            onPressed: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => GetOtp(phoneNumber:phoneNumber)));
            },
          )
        ],
      ),
    );
  }
}