# Phone Auth Simple

This package help you to do `phone verification in just 6 lines of code`. Isn't this great.

## Installation 

`Step 1`- Connect Your app with firebase.<br/>
`Step 2`- Enable Phone Authentication in Firebase.<br/>
`Step 3`-Add `phone_auth_simple: ` in your `pubspec.yaml` dependencies.<br/>

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

## Example

#### lib/home.dart
```dart
import 'package:flutter/material.dart';
import 'package:phone_auth_simple/phone_auth_simple.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Center(
    child:Text("Home Page")
    )
    );
  }
}
```

#### lib/phone_number.dart
```dart
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

```
#### lib/get_otp.dart
```dart
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

```


## Params
  
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
  
## Screenshot
<img src="/screenshot/screen1.JPEG" alt="Screenshot 1"/>
<img src="/screenshot/screen2.JPEG" alt="Screenshot 2"/> 
  
### Upcoming Update
New layout will be added.
More Customization will be added  