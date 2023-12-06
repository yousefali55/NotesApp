import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/Models/note_model.dart';
import 'package:notes/constants/strings.dart';
import 'package:notes/notes_app.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NotelModelAdapter());
  runApp(const NotesApp());
}