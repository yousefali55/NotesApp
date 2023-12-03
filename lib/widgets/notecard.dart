import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Yousef Ali'),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 50.0), // Add space between title and subtitle
          child: Text('This is subtitle of this text'),
        ),
        trailing: Expanded(
          child: Icon(
            Icons.delete,
          ),
        ),
      ),
    );
  }
}
