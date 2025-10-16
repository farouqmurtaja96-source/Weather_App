import 'package:flutter/material.dart';

class DetileWidget extends StatelessWidget {
  const DetileWidget({
    super.key,
    required this.image,
    required this.name,
    required this.time,
  });
  final String image;
  final String name;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image, scale: 9),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontSize: 16, color: Colors.white)),
            Text(
              time,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
