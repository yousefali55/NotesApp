import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/Models/note_model.dart';
import 'package:notes/cubits/note/notes_cubit.dart';
import 'package:notes/widgets/appbar.dart';
import 'package:notes/widgets/textfield.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.note});
  final NotelModel note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomAppBar(
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = content ?? widget.note.subtitle;
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
                title: 'Edit Note',
                icon: const Icon(
                  Icons.check,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustonTextField(
                onChanged: (value) {
                  title = value;
                },
                maxLines: 1,
                hintText: 'Note',
                type: widget.note.title,
              ),
              SizedBox(
                height: 40.h,
              ),
              CustonTextField(
                onChanged: (value) {
                  content = value;
                },
                maxLines: 5,
                hintText: 'Note',
                type: widget.note.subtitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
