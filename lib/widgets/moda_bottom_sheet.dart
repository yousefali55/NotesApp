import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/widgets/add_button_in_modal_botton.dart';
import 'package:notes/widgets/textfield.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 450.h,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          CustonTextField(
            hintText: 'Add Title',
            maxLines: 1,
          ),
          SizedBox(
            height: 30.h,
          ),
          CustonTextField(maxLines: 5, hintText: 'Add Note'),
          const Spacer(),
          AddButtonInModalBottom(),
        ],
      ),
    );
  }
}
