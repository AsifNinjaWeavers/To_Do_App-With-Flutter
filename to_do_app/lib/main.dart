import 'package:flutter/material.dart';
import 'package:to_do_app/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/note.dart';

Future<void> main() async {
  await Hive.initFlutter();
  //
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('box');
  await Hive.openBox<Note>('PinBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
