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
          color: Color(notes[index].color),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              notes[index].title,
              // "How To Make Your Personal brand stand out online",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            Text(
              DateFormat.yMMMMd().format(notes[index].date).toString(),
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  // int getcolor() {
  //   if (notes[index].color == null) {
  //     return 0xff1e7ed9b;
  //   }
  //   return notes[index].color;
  // }
}
