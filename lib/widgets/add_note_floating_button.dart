import 'package:flutter/material.dart';
import 'package:notes/widgets/moda_bottom_sheet.dart';

class AddNoteFloatingButton extends StatelessWidget {
  const AddNoteFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) => ModalBottomSheet());
      },
      backgroundColor: Colors.blueGrey,
      child: Icon(
        Icons.add,
      ),
    );
  }
}
