import 'package:flutter/material.dart';
import 'package:to_do_app/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/note.dart';
import 'package:to_do_app/profile.dart';
import 'package:to_do_app/search.dart';

Future<void> main() async {
  await Hive.initFlutter();
  //
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(ProfileAdapter());
  Hive.registerAdapter(SearchAdapter());
  await Hive.openBox<Note>('box');
  await Hive.openBox<Note>('PinBox');
  await Hive.openBox<Profile>('ProfilBox');
  await Hive.openBox<Search>('SearchBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            elevation: 0, // This removes the shadow from all App Bars.
          )),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
