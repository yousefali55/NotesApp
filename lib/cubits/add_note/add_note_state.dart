part of 'add_note_cubit.dart';

sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}
final class AddNoteLoading extends AddNoteState{}
final class AddNoteSuccess extends AddNoteState{}
final class AddNoteFailure extends AddNoteState{
  final String erorrMessage;

  AddNoteFailure({required this.erorrMessage});
}
