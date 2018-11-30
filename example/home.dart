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