import 'package:flutter/material.dart';
import 'package:kiosk/fingerprint_capture_page.dart';

class AadharEntryPage extends StatefulWidget {
  @override
  _AadharEntryPageState createState() => _AadharEntryPageState();
}

class _AadharEntryPageState extends State<AadharEntryPage> {
  final TextEditingController aadharController = TextEditingController();
  // String? hashedFingerprint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: AadharNumber(aadharController: aadharController, 
        // hashedFingerprint: hashedFingerprint
        ),
      ),
    );
  }
}

class AadharNumber extends StatelessWidget {
  const AadharNumber({
    super.key,
    required this.aadharController,
    // required this.hashedFingerprint,
  });

  final TextEditingController aadharController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: aadharController,
            decoration: InputDecoration(
              labelText: 'Enter Aadhar Number',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            // Collect the user's Aadhar number
            String aadharNumber = aadharController.text;

            // Hash the fingerprint data and store it in hashedFingerprint
            // hashedFingerprint = await hashFingerprint();

            // Navigate to the fingerprint capture page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FingerprintCapturePage(
                  aadharNumber: aadharNumber,
                  // hashedFingerprint: hashedFingerprint,
                ),
              ),
            );
          },
          child: Text('Next'),
        ),
      ],
    );
  }
}
