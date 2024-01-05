import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/cubits/note/notes_cubit.dart';
import 'package:notes/views/notes.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NotesCubit(),
            ),
          ],
          child: const NotesScreen(),
        ),
      ),
    );
  }
}
