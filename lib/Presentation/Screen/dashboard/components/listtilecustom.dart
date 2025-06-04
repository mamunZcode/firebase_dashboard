import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  ListTileCustom({super.key,
    required this.image,
    required this.press,
    required this.title,
    required this.color
  });

  final String   title;
  final Function press;
  final String image;
  Color color;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        leading:
            CircleAvatar(
              radius: 15.0,
              backgroundImage: AssetImage(image),
              backgroundColor: color,
            ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic,fontSize: 10.0),
        ),
        onTap: () {
          press();
        },
        horizontalTitleGap: 0.0,

      ),
    );
  }
}
