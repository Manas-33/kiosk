

import 'package:flutter/material.dart';
import 'package:kiosk/aadhar_entry_page.dart';
import 'package:kiosk/fingerprint_capture_page.dart';
import 'package:kiosk/home_page.dart';
import 'package:kiosk/intro_demo.dart';
import 'package:local_auth/local_auth.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingPage(), 
    );
  }
}