import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/Models/note_model.dart';
import 'package:notes/cubits/add_note/add_note_cubit.dart';
import 'package:notes/cubits/note/notes_cubit.dart';
import 'package:notes/widgets/add_button_in_modal_botton.dart';
import 'package:notes/widgets/textfield.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            // print('state is ${state.erorrMessage}');
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 16.h,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            height: 450.h,
            child: Form(
              key: formKey,
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
                      title = value;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustonTextField(
                      onSaved: (value) {
                        subtitle = value;
                      },
                      type: 'Note',
                      maxLines: 5,
                      hintText: 'Add Note'),
                  SizedBox(
                    height: 60.h,
                  ),
                  AddButtonInModalBottom(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var noteModel = NotelModel(
                            title: title!,
                            subtitle: subtitle!,
                            date: DateTime.now().toString(),
                            color: Colors.grey.value);
                        BlocProvider.of<AddNoteCubit>(context)
                            .addNote(noteModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
