import 'package:flutter/material.dart';

class ViewNote extends StatelessWidget {
  final String title;
  final String notes;
  final String date;
  ViewNote(
      {required this.notes,
      required this.title,
      required this.date,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // color: Colors.black,
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
              icon: Icon(
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
                onPressed: () {},
                icon: Icon(
                  Icons.edit_note_sharp,
                ),
              ),
            ),
          ]),
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 6,
                right: 10,
                top: 20,
              ),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: Text(
                date,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: Text(
                notes,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
