import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    required this.nameController,
    required this.labelText,
    required this.icon,
    required this.obscureText
  });
  final TextEditingController nameController;
  final String labelText;
  final Icon icon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                child: TextFormField(
                  obscureText: obscureText,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic),
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: labelText,
                    prefixIcon: icon,
                    labelStyle: TextStyle(color: Colors.black87),
                    hintText: "Mamun",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}