import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/note.dart';

import 'package:to_do_app/search.dart';
import 'package:to_do_app/viewnote.dart';

class HomeSearchDelegate extends SearchDelegate {
  Box<Note>? pinbox;
  Box<Note>? unpinbox;
  List<Search> search;
  HomeSearchDelegate({required this.search});
  @override
  void initState() {
    unpinbox = Hive.box<Note>('box');
    pinbox = Hive.box<Note>('PinBox');
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Future<List<Search>> searchlist(String str1) async {
      List<Search> ans = [];
      for (int i = 0; i < search.length; i++) {
        if (search[i].title.contains(str1)) {
          ans.add(search[i]);
        }
      }
      return ans;
    }

    return FutureBuilder(
      future: query.isEmpty ? null : searchlist(query.toLowerCase()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: Text("not exist"),
          );
        } else {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: ((context, index) {
                return Container(
                  // color: Colors.black45,
                  child: Column(
                    children: [
                      ListTile(
                        selectedTileColor: Colors.orange[100],
                        hoverColor: Colors.black45,
                        title: Text(
                          snapshot.data[index].note.title,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ViewNote(
                              note: snapshot.data[index].note,
                            );
                          }),
                        ),
                      ),
                      const Divider(
                        height: 10,
                        thickness: 10,
                      ),
                    ],
                  ),
                );
              }));
        }
      },
    );
  }
}
