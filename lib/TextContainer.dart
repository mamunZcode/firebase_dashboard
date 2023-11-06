import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  TextContainer(
      {
        required this.nameController,
      required this.labelText,
      required this.icon,
      required this.obscureText,
      required this.hintText,
        required this.color
      });

  final TextEditingController nameController;
  final String labelText;
  final Icon icon;
  final bool obscureText;
  final hintText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              child: TextFormField(
                obscureText: obscureText,
                style: TextStyle(
                  color: color,
                  fontSize: 20.0,
                  // fontStyle: FontStyle.italic
                ),
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                  labelText: labelText,
                  prefixIcon: icon,
                  labelStyle: TextStyle(color: color),
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
        ))
      ],
    );
  }
}
