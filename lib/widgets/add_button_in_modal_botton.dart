import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/cubits/add_note/add_note_cubit.dart';

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
      child: BlocBuilder<AddNoteCubit, AddNoteState>(
        builder: (context, state) {
          if(state is AddNoteLoading){
            Center(child: CircularProgressIndicator(),);
          }
          return Text(
            'Add',
          );
        },
      ),
    );
  }
}
