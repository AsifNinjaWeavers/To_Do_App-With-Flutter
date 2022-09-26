import 'package:flutter/material.dart';
import 'package:to_do_app/viewnote.dart';

class AddNotes extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  AddNotes({super.key});

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
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white30,
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewNote(
                                date: 'March 27,2022',
                                notes:
                                    "GridView is a widget in Flutter that displays the items in a 2-D array (two-dimensional rows and columns). As the name suggests, it will be used when we want to show items in a Grid. We can select the desired item from the grid list by tapping on them GridView is a widget in Flutter that displays the items in a 2-D array (two-dimensional rows and columns). As the name suggests, it will be used when we want to show items in a Grid. We can select the desired item from the grid list by tapping on them GridView is a widget in Flutter that displays the items in a 2-D array (two-dimensional rows and columns). As the name suggests, it will be used when we want to show items in a Grid. We can select the desired item from the grid list by tapping on them GridView is a widget in Flutter that displays the items in a 2-D array (two-dimensional rows and columns). As the name suggests, it will be used when we want to show items in a Grid. We can select the desired item from the grid list by tapping on them",
                                title:
                                    "Tonight play pubg at 8 PM Tonight play pubg at 8 PM",
                              )),
                    );
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ]),
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 12,
                right: 10,
                top: 20,
              ),
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),

                // cursorColor: Colors.white,

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
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(color: Colors.white, fontSize: 25),
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
