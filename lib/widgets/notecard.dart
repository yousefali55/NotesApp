import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Models/note_model.dart';
import 'package:notes/cubits/note/notes_cubit.dart';
import 'package:notes/views/edit_note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
  final NotelModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const EditNote(),
          ),
        );
      },
      child: Expanded(
        child: Card(
          child: ListTile(
            title: Text(note.title),
            subtitle: Padding(
              padding: const EdgeInsets.only(
                  top: 50.0), // Add space between title and subtitle
              child: Text(note.subtitle),
            ),
            trailing: Expanded(
                child: IconButton(
              onPressed: () {
                note.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
              icon: const Icon(Icons.delete),
            )),
          ),
        ),
      ),
    );
  }
}
