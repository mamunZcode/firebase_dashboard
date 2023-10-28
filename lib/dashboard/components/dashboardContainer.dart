import 'package:flutter/material.dart';

class dashboardContainer extends StatelessWidget {
  const dashboardContainer({
    required this.text,
    required this.bottomText,
    required this.icon,
    required this.color,
    this.child,
    this.height,
    this.width,
    this.decoration,
  });

  final Text text;
  final Text bottomText;
  final IconData icon;
  final Color  color;
  final Widget? child;
  final double? height;
  final double? width;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: color,
        elevation: 4,
        margin: EdgeInsets.all(5.0),
        child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            direction: Axis.vertical,
            children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                text,
                bottomText,
              ],
            ),
          ),
              Icon(
                icon,
                size: 20.0,
              ),
        ]
        ),
      ),
    );
  }
}
