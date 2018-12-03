library phone_auth_simple;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthSimple extends StatefulWidget {
  final String countryCode;
  final String phoneNumber;
  final VoidCallback onVerificationSuccess;
  final VoidCallback onVerificationFailure;
  Color progressIndicatorColor=Colors.red;
  Widget appBar= AppBar(
    title: Text("Enter OTP"),
    backgroundColor: Colors.red,
  );

  PhoneAuthSimple({
    @required this.countryCode,
    @required this.phoneNumber,
    @required this.onVerificationSuccess,
    @required this.onVerificationFailure,
    this.appBar,
    this.progressIndicatorColor
  });

  @override
  _PhoneAuthSimpleState createState() => _PhoneAuthSimpleState();
}

class _PhoneAuthSimpleState extends State<PhoneAuthSimple> {

  int showStatus=1;
  bool isSmsCodeSent = false;
  bool isError = false;

  List<String> optText = [];
  String verificationId;
  String smsCode;

  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
  TextEditingController controller6 = new TextEditingController();
  TextEditingController controller7 = new TextEditingController();

  TextEditingController currController = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
  }

  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
      setState(() {
        showStatus=3;
      });
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeSent]) {
      this.verificationId = verId;
      setState(() {
        showStatus = 2;
      });
    };

    final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user) {
      print("Verified $user");
      setState(() {
        controller1.text="*";
        controller2.text="*";
        controller3.text="*";
        controller4.text="*";
        controller5.text="*";
        controller6.text="*";
        Future.delayed(Duration(seconds: 2),(){
              widget.onVerificationSuccess();
        });
      });
    };

    final PhoneVerificationFailed verfiFailed = (AuthException exception) {
//      print("Failed ${exception.message}");
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "${widget.countryCode}${widget.phoneNumber}",
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: verfiFailed);
  }
//
  manualVerification() {
    print("My Id" + verificationId);
    FirebaseAuth.instance
        .signInWithPhoneNumber(verificationId: verificationId, smsCode: smsCode)
        .then((user) {
      print("Verification Successful");
      print("$user");
      setState(() {
        showStatus=3;
      });
      widget.onVerificationSuccess();
    }).catchError((error) {
      print("Verification Failed Due to $error");
      widget.onVerificationFailure();
    });
  }

  @override
  void initState() {
    super.initState();
    currController = controller1;
    verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      Padding(
        padding: EdgeInsets.only(left: 0.0, right: 2.0),
        child: new Container(
          color: Colors.transparent,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: new Container(
            alignment: Alignment.center,
            decoration: new BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                border: new Border.all(
                    width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
                borderRadius: new BorderRadius.circular(4.0)),
            child: new TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
              enabled: false,
              controller: controller1,
              autofocus: false,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, color: Colors.black),
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: new Container(
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              border: new Border.all(
                  width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
              borderRadius: new BorderRadius.circular(4.0)),
          child: new TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            controller: controller2,
            autofocus: false,
            enabled: false,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0, color: Colors.black),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: new Container(
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              border: new Border.all(
                  width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
              borderRadius: new BorderRadius.circular(4.0)),
          child: new TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            keyboardType: TextInputType.number,
            controller: controller3,
            textAlign: TextAlign.center,
            autofocus: false,
            enabled: false,
            style: TextStyle(fontSize: 24.0, color: Colors.black),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: new Container(
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              border: new Border.all(
                  width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
              borderRadius: new BorderRadius.circular(4.0)),
          child: new TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textAlign: TextAlign.center,
            controller: controller4,
            autofocus: false,
            enabled: false,
            style: TextStyle(fontSize: 24.0, color: Colors.black),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: new Container(
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              border: new Border.all(
                  width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
              borderRadius: new BorderRadius.circular(4.0)),
          child: new TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textAlign: TextAlign.center,
            controller: controller5,
            autofocus: false,
            enabled: false,
            style: TextStyle(fontSize: 24.0, color: Colors.black),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: new Container(
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              border: new Border.all(
                  width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
              borderRadius: new BorderRadius.circular(4.0)),
          child: new TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textAlign: TextAlign.center,
            controller: controller6,
            autofocus: false,
            enabled: false,
            style: TextStyle(fontSize: 24.0, color: Colors.black),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 2.0, right: 0.0),
        child: new Container(
          color: Colors.transparent,
        ),
      ),
    ];

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: widget.appBar==null?AppBar(
        title: Text("Enter OTP"),
        backgroundColor: Colors.red,
      ):widget.appBar,
      backgroundColor: Color(0xFFeaeaea),
      body: Container(
        child: Column(
            children: <Widget>[
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Verifying your number!",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 4.0, right: 16.0),
                      child: Text(
                        "Please type the verification code sent to",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 2.0, right: 30.0),
                      child: Text(
                        "+91 ${widget.phoneNumber}",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Image(
                        image: AssetImage('assets/otp-icon.png'),
                        height: 120.0,
                        width: 120.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: codeStatus()
                    )
                  ],
                ),
                flex: 90,
              ),
              Flexible(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                  GridView.count(
                  crossAxisCount: 8,
                      mainAxisSpacing: 10.0,
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      children: List<Container>.generate(
                      8,
                          (int index) =>
                          Container(child: widgetList[index]))),
            ]),
        flex: 20,
      ),
      Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 16.0, right: 8.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        inputTextToField("1");
                      },
                      child: Text("1",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                    MaterialButton(
                      onPressed: () {
                        inputTextToField("2");
                      },
                      child: Text("2",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                    MaterialButton(
                      onPressed: () {
                        inputTextToField("3");
                      },
                      child: Text("3",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ),
            new Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 4.0, right: 8.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        inputTextToField("4");
                      },
                      child: Text("4",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                    MaterialButton(
                      onPressed: () {
                        inputTextToField("5");
                      },
                      child: Text("5",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                    MaterialButton(
                      onPressed: () {
                        inputTextToField("6");
                      },
                      child: Text("6",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ),
            new Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 4.0, right: 8.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        inputTextToField("7");
                      },
                      child: Text("7",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                    MaterialButton(
                      onPressed: () {
                        inputTextToField("8");
                      },
                      child: Text("8",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                    MaterialButton(
                      onPressed: () {
                        inputTextToField("9");
                      },
                      child: Text("9",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ),
            new Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 4.0, right: 8.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MaterialButton(
                        onPressed: () {
                          deleteText();
                        },
                        child: Image.asset('assets/delete.png',
                            width: 25.0, height: 25.0)),
                    MaterialButton(
                      onPressed: () {
                        inputTextToField("0");
                      },
                      child: Text("0",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                    MaterialButton(
                        onPressed: () {
                          matchOtp();
                        },
                        child: Image.asset('assets/success.png',
                            width: 25.0, height: 25.0)),
                  ],
                ),
              ),
            ),
          ],
        ),
        flex: 90,
      ),
      ],
    ),
    ),
    );
  }

  void inputTextToField(String str) {
    //Edit first textField
    if (currController == controller1) {
      optText.insert(0, str);
      controller1.text = str;
      currController = controller2;
    }

    //Edit second textField
    else if (currController == controller2) {
      optText.insert(1, str);
      controller2.text = str;
      currController = controller3;
    }

    //Edit third textField
    else if (currController == controller3) {
      optText.insert(2, str);
      controller3.text = str;
      currController = controller4;
    }

    //Edit fourth textField
    else if (currController == controller4) {
      optText.insert(3, str);
      controller4.text = str;
      currController = controller5;
    }

    //Edit fifth textField
    else if (currController == controller5) {
      optText.insert(4, str);
      controller5.text = str;
      currController = controller6;
    }

    //Edit sixth textField
    else if (currController == controller6) {
      if (optText.length == 6) {
        optText.removeLast();
        optText.insert(5, str);
      } else {
        optText.insert(5, str);
      }
      controller6.text = str;
      currController = controller6;
    }
  }

  void deleteText() {
    optText.removeLast();
    if (currController.text.length == 0) {
    } else {
      currController.text = "";
      currController = controller5;
      return;
    }

    if (currController == controller1) {
      controller1.text = "";
    } else if (currController == controller2) {
      controller1.text = "";
      currController = controller1;
    } else if (currController == controller3) {
      controller2.text = "";
      currController = controller2;
    } else if (currController == controller4) {
      controller3.text = "";
      currController = controller3;
    } else if (currController == controller5) {
      controller4.text = "";
      currController = controller4;
    } else if (currController == controller6) {
      controller5.text = "";
      currController = controller5;
    }
  }

  void matchOtp() {
    smsCode = optText.join();
    print("Entered OTP is ${optText.join()}");
    manualVerification();
    setState(() {
      showStatus=3;
    });
  }

  Widget codeStatus(){
    if(showStatus==1){
      return Text(
        "Sending SMS ......",
        style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.red),
        textAlign: TextAlign.center,
      );
    }
    if(showStatus==2){
      return Text(
        "SMS code Sent",
        style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.green),
        textAlign: TextAlign.center,
      );
    }
    if(showStatus==3){
        return CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(widget.progressIndicatorColor==null?Colors.red:widget.progressIndicatorColor));
    }
    return Container();
  }
}