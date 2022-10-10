import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:to_do_app/itemdesign.dart';
import 'package:to_do_app/note.dart';
import 'package:to_do_app/profile.dart';

class PinnedItemView extends StatefulWidget {
  final Color notextextcolor;
  const PinnedItemView({required this.notextextcolor, super.key});

  @override
  State<PinnedItemView> createState() => _PinnedItemViewState();
}

class _PinnedItemViewState extends State<PinnedItemView> {
  Box<Profile>? profile;
  Box<Note>? pinbox;
  Box<Note>? unpinbox;
  List<Note> notes = [];
  List<Note> pinnotes = [];
  @override
  void initState() {
    super.initState();
    unpinbox = Hive.box<Note>('box');
    pinbox = Hive.box<Note>('PinBox');
    profile = Hive.box<Profile>('ProfilBox');
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: profile!.listenable(),
      builder: (BuildContext context, value, _) {
        return ValueListenableBuilder(
          valueListenable: pinbox!.listenable(),
          builder: (BuildContext context, value, _) {
            return GridView.custom(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 6,
                mainAxisSpacing: 22,
                crossAxisSpacing: 22,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  const QuiltedGridTile(3, 3),
                  const QuiltedGridTile(2, 3),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: value.length,
                (context, index) => ItemDesign(
                  profile: profile!,
                  mainbox: pinbox!,
                  supportbox: unpinbox!,
                  notes: value.values.toList(),
                  index: index,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
