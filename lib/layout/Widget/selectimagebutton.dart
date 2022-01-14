import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SelectImageButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  const SelectImageButton({
    Key key,
    this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: EdgeInsets.all(20),
      minDistance: -5,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: Duration(milliseconds: 200),
      style: NeumorphicStyle(
        color: Colors.white,
        depth: 20,
        intensity: 0.9,
      ),
    );
  }
}
