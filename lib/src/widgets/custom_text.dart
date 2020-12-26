import 'package:flutter/material.dart';

import '../commons.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  CustomText({@required this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color?? black, fontSize: size ?? 16, fontWeight: weight ?? FontWeight.normal),
    );
  }
}
