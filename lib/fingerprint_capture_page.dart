// fingerprint_capture_page.dart
import 'package:flutter/material.dart';
import 'package:kiosk/home_page.dart';
import 'package:local_auth/local_auth.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class FingerprintCapturePage extends StatefulWidget {
  final String aadharNumber;

  FingerprintCapturePage(
      {required this.aadharNumber, String? hashedFingerprint});

  @override
  _FingerprintCapturePageState createState() => _FingerprintCapturePageState();
}

class _FingerprintCapturePageState extends State<FingerprintCapturePage> {
  final LocalAuthentication localAuth = LocalAuthentication();
  String? capturedFingerprintHash;
  bool isTransitioning = false;

  Future<void> captureFingerprint() async {
    try {
      final didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Scan your fingerprint to proceed.',
      );

      if (didAuthenticate) {
        // Capture the fingerprint data (replace this with your logic)
        const capturedFingerprintData = 'captured_fingerprint_data';

        // Hash the captured fingerprint data using SHA-256
        final fingerprintBytes = utf8.encode(capturedFingerprintData);
        final fingerprintHash = sha256.convert(fingerprintBytes);

        setState(() {
          capturedFingerprintHash = fingerprintHash.toString();
          isTransitioning = true;
        });

        // Navigate to the home page
        await Future.delayed(Duration(milliseconds: 500));

        // Navigate to the home page with a fade-in transition
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: Home(),
              );
            },
          ),
        );
      } 
    } catch (e) {
      print('Fingerprint capture error: $e');
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture Fingerprint'),
      ),
      body: Center(
        child: Container(
          width: double.maxFinite,
          color: Color.fromARGB(255, 105, 224, 113),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),

                // Image.network(src)
                child: Image.network(
                    "https://www.onmsft.com/wp-content/uploads/2020/04/microsoftauth.jpg",
                    height: 200.0,
                    width: 200.0),
              ),
              ElevatedButton(
                onPressed: () async {
                  await captureFingerprint();
                },
                child: const Text('keep finger on scanner'),
              ),
        //       TextButton(
        //       style: ButtonStyle(
        //       backgroundColor: MaterialStateProperty.all(color), //Background Color
        //       elevation: MaterialStateProperty.all(3), //Defines Elevation
        //       shadowColor: MaterialStateProperty.all(color), //Defines shadowColor
        // ),
        // onPressed: () {},
        // child: Text('bla'),
        // ),
// )
              const AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 1500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
