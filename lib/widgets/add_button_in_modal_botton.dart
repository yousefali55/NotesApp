import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddButtonInModalBottom extends StatelessWidget {
  const AddButtonInModalBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
