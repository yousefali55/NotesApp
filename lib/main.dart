import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/Models/note_model.dart';
import 'package:notes/constants/strings.dart';
import 'package:notes/notes_app.dart';
import 'package:notes/simple_bloc_observer.dart';

void main() async{
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NotelModelAdapter());
  await Hive.openBox<NotelModel>(kNotesBox);
  runApp(const NotesApp());
}