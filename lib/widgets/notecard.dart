import 'package:flutter/material.dart';
import 'package:notes/Models/note_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
  final NotelModel note;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: ListTile(
          title: Text(note.title),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 50.0), // Add space between title and subtitle
            child: Text(note.subtitle),
          ),
          trailing:  Expanded(
            child: IconButton(
              onPressed: (){
                note.delete();
              },
              icon: const Icon(Icons.delete),
            )
            ),
          ),
      ),
    );
  }
}
