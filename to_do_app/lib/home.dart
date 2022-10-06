import 'package:flutter/material.dart';
import 'package:to_do_app/addnote.dart';
import 'package:to_do_app/homebodydesign.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding: const EdgeInsets.only(left: 1, right: 18),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: const Color(0xf1252525),
            title: const Text(
              'Notes',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.normal),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xf13b3b3b),
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
        ),
      ),
      backgroundColor: const Color(0xf1252525),
      body: const HomeBodyDesign(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xf1252525),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddNotes()),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
