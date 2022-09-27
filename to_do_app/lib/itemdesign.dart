import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/note.dart';
import 'package:to_do_app/viewnote.dart';

class ItemDesign extends StatelessWidget {
  final List<Note> notes;
  final int index;
  const ItemDesign({required this.index, required this.notes, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ViewNote(
                  note: notes[index],
                );
              },
            ),
          )),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xffffab91),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              notes[index].title,
              // "How To Make Your Personal brand stand out online",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat.yMMMMd().format(DateTime.now()).toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
