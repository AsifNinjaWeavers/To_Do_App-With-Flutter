import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/editnote.dart';
import 'package:to_do_app/note.dart';

class ViewNote extends StatelessWidget {
  final Note note;
  const ViewNote({required this.note, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white30,
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
          actions: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white30,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditNote(
                          note: note,
                        );
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit_note_sharp,
                ),
              ),
            ),
          ]),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 20,
            bottom: 20,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note.title,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        wordSpacing: 2.5,
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                DateFormat.yMMMMd().format(note.date).toString(),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  wordSpacing: 2.5,
                  color: Colors.white54,
                  fontSize: 19,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                note.notetext,
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
