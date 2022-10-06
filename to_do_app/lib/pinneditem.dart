import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:to_do_app/itemdesign.dart';
import 'package:to_do_app/pinneditem.dart';
import 'package:to_do_app/note.dart';

class PinnedItemView extends StatefulWidget {
  const PinnedItemView({super.key});

  @override
  State<PinnedItemView> createState() => _PinnedItemViewState();
}

class _PinnedItemViewState extends State<PinnedItemView> {
  Box<Note>? pinbox;
  Box<Note>? unpinbox;
  List<Note> notes = [];
  List<Note> pinnotes = [];
  @override
  void initState() {
    super.initState();
    unpinbox = Hive.box<Note>('box');
    pinbox = Hive.box<Note>('PinBox');
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pinbox!.listenable(),
      builder: (BuildContext context, value, _) {
        return GridView.custom(
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: [
              const QuiltedGridTile(2, 2),
              const QuiltedGridTile(1, 2),
              const QuiltedGridTile(1, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: value.length,
            (context, index) => ItemDesign(
              mainbox: pinbox!,
              supportbox: unpinbox!,
              notes: value.values.toList(),
              index: index,
            ),
          ),
        );
      },
    );
  }
}
