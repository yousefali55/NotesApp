import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes/Models/note_model.dart';
import 'package:notes/constants/strings.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NotelModel>? notes;
  fetchAllNotes(){
    var notesbox = Hive.box<NotelModel>(kNotesBox);
    notes = notesbox.values.toList();
    emit(NotesSuccess());
  }
}
