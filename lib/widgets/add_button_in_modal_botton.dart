import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddButtonInModalBottom extends StatelessWidget {
  AddButtonInModalBottom({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(
            375.w,
            60.h,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.blueGrey,
        ),
      ),
      child: Text(
        'Add',
      ),
    );
  }
}
