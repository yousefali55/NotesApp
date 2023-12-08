import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/cubits/note/notes_cubit.dart';
import 'package:notes/widgets/add_note_floating_button.dart';
import 'package:notes/widgets/appbar.dart';
import 'package:notes/widgets/listview_notes_card.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Notes',
                icon: Icons.search,
              ),
              SizedBox(
                height: 20.h,
              ),
              ListViewNoteCards(),
              AddNoteFloatingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
//flutter packages pub run build_runner build