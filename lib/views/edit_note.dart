import 'package:flutter/material.dart';
import 'package:notes/widgets/appbar.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: CustomAppBar(
            title: 'Edit Note',
            icon: Icon(
              Icons.check,
            ),
          ),
        ),
      ),
    );
  }
}
