import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kiosk/aadhar_entry_page.dart';
import 'package:kiosk/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => AadharEntryPage()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      
      allowImplicitScrolling: true,
     
      
      
      
      pages: [
      
        PageViewModel(
          title: "Welcome to kiosk",
          body: "Your Health, Your Kiosk: Fast, Convenient, Reliable.",
          image: Center(
            child: Image.network(
                "https://image.pngaaa.com/2/4866002-middle.png",
                height: 175.0),
          ),
          decoration: const PageDecoration(
            pageColor: Color.fromARGB(255, 105, 224, 113),
          ),
        ),
        PageViewModel(
          title: "Welcome to kiosk",
          body: "Your Health, Your Kiosk: Fast, Convenient, Reliable.",
          image: Center(
            child: Image.network(
                "https://icon-library.com/images/facility-icon/facility-icon-18.jpg",
                height: 175.0),
          ),
          decoration: const PageDecoration(
            pageColor: Color.fromARGB(255, 105, 224, 113),
          ),
        ),
        PageViewModel(
          title: "Welcome to kiosk",
          body: "Your Health, Your Kiosk: Fast, Convenient, Reliable.",
          image: Center(
            child: Image.network(
                "https://cdn.dribbble.com/users/1549225/screenshots/4861075/doctor.png",
                height: 175.0),
          ),
          decoration: const PageDecoration(
            pageColor: Color.fromARGB(255, 105, 224, 113),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      
    );
  }
}
// class IntroScreenDemo extends StatefulWidget {
//   @override
//   State<IntroScreenDemo> createState() => _IntroScreenDemoState();
// }

// class _IntroScreenDemoState extends State<IntroScreenDemo> {
//   // 1. Define a `GlobalKey` as part of the parent widget's state
//   final _introKey = GlobalKey<IntroductionScreenState>();
//   String _status = 'Waiting...';

//   @override
//   Widget build(BuildContext context) {
//     return IntroductionScreen(
//       key: _introKey,
//       pages: [
//         PageViewModel(
//           title: "Welcome to kiosk",
//           body: "Your Health, Your Kiosk: Fast, Convenient, Reliable.",
//           image: Center(
//             child: Image.network(
//                 "https://image.pngaaa.com/2/4866002-middle.png",
//                 height: 175.0),
//           ),
//           decoration: const PageDecoration(
//             pageColor: Color.fromARGB(255, 105, 224, 113),
//           ),
//         ),
//         PageViewModel(
//           title: "Welcome to kiosk",
//           body: "Your Health, Your Kiosk: Fast, Convenient, Reliable.",
//           image: Center(
//             child: Image.network(
//                 "https://image.pngaaa.com/2/4866002-middle.png",
//                 height: 175.0),
//           ),
//           decoration: const PageDecoration(
//             pageColor: Color.fromARGB(255, 105, 224, 113),
//           ),
//         ),
//       ],
//       showNextButton: false,
//       showDoneButton: true,
//       overrideDone: const Text("Done"),
//       onDone: () => _onIntroEnd(context),
//     );
//   }
// }

// void _onIntroEnd(context) {
//   Navigator.of(context).pushReplacement(
//     MaterialPageRoute(builder: (_) => HomePage()),
//   );
// }
