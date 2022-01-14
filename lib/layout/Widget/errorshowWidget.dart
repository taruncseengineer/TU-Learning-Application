import 'package:flutter/material.dart';

class ErrorShowWidget extends StatelessWidget {
  const ErrorShowWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          "Internet is Disconnected.",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
