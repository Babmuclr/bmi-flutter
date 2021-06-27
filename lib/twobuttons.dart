import 'dart:ffi';

import 'package:flutter/material.dart';

class twobutton extends StatelessWidget {
  twobutton({Function this.onPress1, Function this.onPress2, IconData this.icon1, IconData this.icon2, Color this.color});
  final Function onPress1;
  final Function onPress2;
  final IconData icon1;
  final IconData icon2;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          child: Icon(
            icon1,
          ),
          onPressed: onPress1,
          elevation: 6,
          constraints: BoxConstraints.tightFor(
            width: 56.0,
            height: 56.0,
          ),
          shape: CircleBorder(),
          fillColor: color,
        ),
        SizedBox(
          width: 16.0,
        ),
        RawMaterialButton(
          child: Icon(
            icon2,
          ),
          onPressed: onPress2,
          elevation: 6,
          constraints: BoxConstraints.tightFor(
            width: 56.0,
            height: 56.0,
          ),
          shape: CircleBorder(),
          fillColor: color,
        )
      ],
    );
  }
}
