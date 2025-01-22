import 'package:flutter/material.dart';

class SplashScreenController {
  final BuildContext context;

  SplashScreenController(this.context);

  void navigateToNextScreen() {
    // Wait for 3 seconds and navigate to the next screen
    Future.delayed(const Duration(seconds: 20), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NextScreen(),
        ),
      );
    });
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Screen')),
      body: const Center(
        child: Text('Welcome to the next screen!'),
      ),
    );
  }
}
