import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppName extends StatelessWidget {
  const AppName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicText(
      "TULearning",
      style: NeumorphicStyle(
        color: Colors.blue[900],
        depth: 10,
        intensity: 6,
        surfaceIntensity: 0.5,
        lightSource: LightSource.top,
      ),
      textStyle: NeumorphicTextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.5,
      ),
    );
  }
}
