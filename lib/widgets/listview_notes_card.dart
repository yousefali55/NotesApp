import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Models/note_model.dart';
import 'package:notes/cubits/note/notes_cubit.dart';
import 'package:notes/widgets/notecard.dart';

class ListViewNoteCards extends StatelessWidget {
  const ListViewNoteCards({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NotelModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteCard();
            },
          ),
        );
      },
    );
  }
}
