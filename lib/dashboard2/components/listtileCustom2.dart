import 'package:flutter/material.dart';

class ListTileCustom2 extends StatelessWidget {
  ListTileCustom2({
    required this.image,
    required this.press,
    this.color,
    this.foregroundColor,
  });
  final Function press;
  final String image;
  Color ? color;
  Color ? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: color,
        child: Center(
          child: ListTile(
            leading:
            CircleAvatar(
              foregroundColor: foregroundColor,
              radius: 15.0,
              backgroundImage: AssetImage(image),
              backgroundColor: color,
            ),
            onTap: () {
              press();
            },
            horizontalTitleGap: 0.0,
          ),
        ),
      ),
    );
  }
}