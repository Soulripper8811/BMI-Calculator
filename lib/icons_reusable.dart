import 'package:flutter/material.dart';

import 'constants.dart';

class CardData extends StatelessWidget {
  CardData({this.icon, this.label1});
  final IconData? icon;
  final String? label1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          label1.toString(),
          style: textStyle,
        ),
      ],
    );
  }
}
