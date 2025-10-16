import 'package:flutter/material.dart';

class background_widget extends StatelessWidget {
  const background_widget({super.key, required this.x, required this.y});
  final double x;
  final double y;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(x, y),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
