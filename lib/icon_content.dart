import 'package:flutter/material.dart';

const lebelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98)
);

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(

        ),
        Text(
          label,
          style: lebelTextStyle,
        )
      ],
    );
  }
}
