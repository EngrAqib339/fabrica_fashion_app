import 'package:flutter/material.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  late SplashScreenController _controller;

  // Animation controllers
  late AnimationController _fadeController;
  late AnimationController _slideController;

  @override
  void initState() {
    super.initState();

    // Initialize splash screen controller
    _controller = SplashScreenController(context);
    _controller.navigateToNextScreen();

    // Initialize fade animation controller
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Initialize slide animation controller
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Start animations
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background circles
          const PositionedCircles(),

          // Centered content (logo and text)
          Center(
            child: FadeTransition(
              opacity: _fadeController,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circular logo with "f"
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.brown,
                    child: Text(
                      'f',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // "fashion." text
                  Text(
                    'fashion.',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom footer ("Insightlancer")
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _slideController.drive(
                Tween<Offset>(
                  begin: const Offset(0, 2), // Start off-screen below
                  end: Offset.zero, // End at its original position
                ).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Insightlancer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PositionedCircles extends StatelessWidget {
  const PositionedCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top-left circle
        Positioned(
          top: -50,
          left: -50,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.black.withOpacity(0.05),
          ),
        ),

        // Bottom-left circle
        Positioned(
          bottom: -100,
          left: -100,
          child: CircleAvatar(
            radius: 150,
            backgroundColor: Colors.black.withOpacity(0.05),
          ),
        ),

        // Top-right circle
        Positioned(
          top: -80,
          right: -80,
          child: CircleAvatar(
            radius: 120,
            backgroundColor: Colors.black.withOpacity(0.03),
          ),
        ),
      ],
    );
  }
}
