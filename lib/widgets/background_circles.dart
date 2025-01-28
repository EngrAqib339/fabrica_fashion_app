import 'package:flutter/material.dart';

class BackgroundCircles extends StatelessWidget {
  const BackgroundCircles({Key? key}) : super(key: key);

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
