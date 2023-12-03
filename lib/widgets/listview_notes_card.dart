import 'package:flutter/material.dart';
import 'package:notes/widgets/notecard.dart';

class ListViewNoteCards extends StatelessWidget {
  const ListViewNoteCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder:(context, index){
          return NoteCard();
        }
        ),
    );
  }
}