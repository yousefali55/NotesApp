
import 'package:flutter/material.dart';

class CustonTextField extends StatelessWidget {
  const CustonTextField({super.key, required this.maxLines, required this.hintText, this.onSaved, required this.type, this.onChanged});
  final int maxLines;
  final String hintText;
  final String type;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value){
        if(value?.isEmpty ?? true){
          return '$type is required';
        }
        else{
          return null;
        }
        

      },
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.blueGrey,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blueGrey,
            width: 1
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
