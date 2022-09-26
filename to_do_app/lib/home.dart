import 'package:flutter/material.dart';
import 'package:to_do_app/addnote.dart';
import 'package:to_do_app/itemview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Notes',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.normal),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white30,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: const ItemView(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNotes()),
            );
          },
          child: Icon(Icons.add)),
    );
  }
}
