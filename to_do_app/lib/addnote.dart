// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/note.dart';
import 'package:to_do_app/viewnote.dart';

class AddNotes extends StatefulWidget {
  AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();
  Box<Note>? box;
  @override
  void initState() {
    // TODO: implement initState
    box = Hive.box<Note>('box');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // color: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            leading: PreferredSize(
              preferredSize: Size.fromRadius(1),
              child: Container(
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff13b3b3b),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                  iconSize: 20,
                ),
              ),
            ),
            actions: [
              Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff13b3b3b),
                ),
                child: TextButton(
                    onPressed: () {
                      // Note a = Note(
                      //   title:
                      //       "Beautiful weather app UI concepts we wish existed",
                      //   notetext: "asjasnja",
                      //   // "GridView is a widget in Flutter that displays the items in a 2-D array (two-dimensional rows and columns). As the name suggests, it will be used when we want to show items in a Grid. We can select the desired item from the grid list by tapping on them GridView is a widget in Flutter that displays the items in a 2-D array (two-dimensional rows and columns). As the name suggests, it will be used when we want to show items in a Grid. We can select the desired item from the grid list by tapping on them GridView is a widget in Flutter that displays the items in a 2-D array (two-dimensional rows and columns). As the name suggests, it will be used when we want to show items in a Grid. We can select the desired item from the grid list by tapping on them GridView is a widget in Flutter that displays the items in a 2-D array (two-dimensional rows and columns). As the name suggests, it will be used when we want to show items in a Grid. We can select the desired item from the grid list by tapping on them",
                      //   date: DateTime.now(),
                      // );

                      box?.put(
                          '1',
                          Note(
                              title: 'title',
                              notetext: 'notetext',
                              date: DateTime.now(),
                              id: 'id'));
                      // print(box.get(1));
                      Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return ViewNote(
                      //         note: Note(
                      //             title: "title",
                      //             notetext: "notetext",
                      //             date: DateTime.now(),
                      //             id: '1'),
                      //       );
                      //     },
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ]),
      ),
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 12,
                right: 10,
                top: 20,
              ),
              child: TextFormField(
                // initialValue: "asddf",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
                controller: titleController,
                decoration: const InputDecoration.collapsed(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 35,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 10,
                top: 20,
              ),
              child: TextFormField(
                controller: noteController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(color: Colors.white, fontSize: 25),
                decoration: const InputDecoration(
                  // fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  focusColor: Colors.white,
                  // filled: true,
                  hintText: 'Type something......',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
