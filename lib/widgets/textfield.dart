import 'package:flutter/material.dart';

class CustonTextField extends StatelessWidget {
  const CustonTextField({super.key, required this.maxLines, required this.hintText});
  final int maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.blueGrey,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 1
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
