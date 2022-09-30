import 'package:flutter/material.dart';
import 'package:to_do_app/addnote.dart';
import 'package:to_do_app/pinneditem.dart';
import 'package:to_do_app/normalitemview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Importent Notes',
              style: TextStyle(color: Colors.amber, fontSize: 20),
              textDirection: TextDirection.ltr,
            ),
            const PinnedItemView(),
            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.white,
            ),
            Container(
              // padding: ,
              padding: EdgeInsets.only(top: 5),
              child: const Text(
                'Normal Notes',
                style: TextStyle(color: Colors.amber, fontSize: 20),
                textDirection: TextDirection.ltr,
              ),
            ),
            const NormalItemView(),
          ],
        ),
      ),
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
