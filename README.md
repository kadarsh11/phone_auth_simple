# Phone Auth Simple

This package help you to do `phone verification in just 6 lines of code`. Isn't this great.

## Installation 

`Step 1`- Connect Your app with firebase.
`Step 2`- Enable Phone Authentication in Firebase.
`Step 3`-Add `phone_auth_simple: ` in your `pubspec.yaml` dependencies.

## How to use
```dart
import 'package:flutter/material.dart';
import 'package:phone_auth_simple/phone_auth_simple.dart';

class Test extends StatefulWidget {
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return PhoneAuthSimple(
      countryCode: "+91",
      phoneNumber: "9999999999",
      onVerificationSuccess: () {
        print("My Completed");
      },
      onVerificationFailure: () {
        print("My Failed");
      },
    );
  }
}
```

##Params
  
  ```
   PhoneAuthSimple(
   @required countryCode (String) 
   @required phoneNumber (String)
   @required onVerificationSuccess (VoidCallBack)
   @required onVerificationFailure (VoidCallBack)
    appBar (Widget)
    progressIndicatorColor (Color)
  )
  ```
  
###Upcoming Update
New layout will be added.
More Customization will be added  