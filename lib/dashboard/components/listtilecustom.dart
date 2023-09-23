import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  ListTileCustom({
    required this.image,
    required this.press,
    required this.title,
    required this.color
  });

  final String title;
  final Function press;
  final String image;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        leading: Image(
          image: AssetImage(image),
          color: Colors.redAccent,
          height: 16,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic),
        ),
        onTap: () {
          press();
        },
        horizontalTitleGap: 0.0,

      ),
    );
  }
}
