import 'dart:ui';

import 'package:flutter/material.dart';

class CurrentTabBackground extends StatelessWidget {
  const CurrentTabBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/weather.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: Container(
            color: Colors.black45.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
