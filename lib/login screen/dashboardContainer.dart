import 'package:flutter/material.dart';

class dashboardContainer extends StatelessWidget {


  const dashboardContainer({
    required this.text,
    required this.bottomText,
    required this.icon,
    required this.color

  });
  final Text text;
  final Text bottomText;
  final  IconData icon;
  final Color color;



  @override
  Widget build(BuildContext context) {
    return Expanded(child:
    Card(
      color: color,
      elevation: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text,
                  bottomText,
                ],
              ),
            ),
            Icon(icon,size:20.0,),
          ]
      ),
    )
    );
  }
}