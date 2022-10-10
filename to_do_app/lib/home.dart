import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:intl/intl.dart';
import 'package:to_do_app/addnote.dart';
import 'package:to_do_app/homebodydesign.dart';
import 'package:to_do_app/search.dart';
import 'package:to_do_app/homesearchdelegate.dart';

import 'navbar.dart';

class HomeScreen extends StatefulWidget {
  Color notetextcolor = Colors.black;

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box<Search>? searchbox;
  List<Search>? search;
  @override
  void initState() {
    super.initState();
    searchbox = Hive.box<Search>('SearchBox');
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: searchbox!.listenable(),
        builder: (BuildContext context, value, _) {
          return Scaffold(
            drawer: NavDrawer(
              pickcolor: widget.notetextcolor,
            ),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 18),
                child: AppBar(
                  elevation: 0,
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(
                          Icons.short_text,
                          color: Colors.black87,
                          size: 30,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context)
                            .openAppDrawerTooltip,
                      );
                    },
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color(0xf1f9f8fe),
                  title: Text(
                    DateFormat.yMMMMd().format(DateTime.now()).toString(),
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: HomeSearchDelegate(
                                search: searchbox!.values.toList()));
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Image.asset(
                        'assest/images/1f468.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: const Color(0xf1f9f8fe),
            body: HomeBodyDesign(notetextcolor: widget.notetextcolor),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
                backgroundColor: const Color.fromARGB(240, 230, 64, 114),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddNotes()),
                  );
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          );
        });
  }
}
