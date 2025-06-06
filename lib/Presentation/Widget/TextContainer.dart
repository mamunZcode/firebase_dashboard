import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  const TextContainer(
      {super.key,
        required this.nameController,
      required this.labelText,
      required this.icon,
      required this.obscureText,
      required this.hintText,
        required this.color,
        this.iconButton,
      });

  final TextEditingController nameController;
  final String labelText;
  final Icon icon;
  final bool obscureText;
  final hintText;
  final Color color;
  final IconButton? iconButton;

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
                  suffixIcon: iconButton,
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
