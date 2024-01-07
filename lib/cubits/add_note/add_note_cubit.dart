import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/Models/note_model.dart';
import 'package:notes/constants/strings.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NotelModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NotelModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(erorrMessage: 'Error is ${e.toString()}'));
    }
  }
}
