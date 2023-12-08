import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/widgets/add_note_floating_button.dart';
import 'package:notes/widgets/appbar.dart';
import 'package:notes/widgets/listview_notes_card.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
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