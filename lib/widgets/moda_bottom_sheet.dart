import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/widgets/add_button_in_modal_botton.dart';
import 'package:notes/widgets/textfield.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final GlobalKey<FormState> FormKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 450.h,
      child: Form(
        key: FormKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            CustonTextField(
              type: 'title',
              hintText: 'Add Title',
              maxLines: 1,
              onSaved: (value) {
                value = title;
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            CustonTextField(
                onSaved: (value) {
                  value = subTitle;
                },
                type: 'Note',
                maxLines: 5,
                hintText: 'Add Note'),
            const Spacer(),
            AddButtonInModalBottom(
              onPressed: () {
                if (FormKey.currentState!.validate()) {
                  FormKey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
