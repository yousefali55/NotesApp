import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes/Models/note_model.dart';
import 'package:notes/cubits/add_note/add_note_cubit.dart';
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
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('state is ${state.erorrMessage}');
          }
          if (State is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: Container(
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
                    const Spacer(),
                    AddButtonInModalBottom(
                      onPressed: () {
                        if (FormKey.currentState!.validate()) {
                          FormKey.currentState!.save();
                          var noteModel = NotelModel(
                              title: title!,
                              subtitle: subtitle!,
                              date: DateTime.now().toString(),
                              color: Colors.grey.value);
                          BlocProvider.of<AddNoteCubit>(context)
                              .addNote(noteModel);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
