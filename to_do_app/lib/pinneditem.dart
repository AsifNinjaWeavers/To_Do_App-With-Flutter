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
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 8,
            repeatPattern: QuiltedGridRepeatPattern.same,
            pattern: [
              const QuiltedGridTile(2, 2),
              const QuiltedGridTile(2, 2),
              const QuiltedGridTile(4, 2),
              const QuiltedGridTile(2, 2),
              const QuiltedGridTile(2, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: value.length,
            (context, index) =>
                // value.values.elementAt(index).pin==true?Itemparts():
                ItemDesign(
              pinbox: pinbox!,
              unpinbox: unpinbox!,
              notes: value.values.toList(),
              index: index,
            ),
          ),
        );
      },
    );
  }
}






// FutureBuilder(
//       // future: ,
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const SizedBox(
//               height: 20, width: 20, child: CircularProgressIndicator());
//         } else if (!snapshot.hasData) {
//           return const Center(
//             child: Text(
//               'You have not added any notes',
//               style: TextStyle(color: Colors.white54, fontSize: 20),
//             ),
//           );
//         } else {
//           return GridView.custom(
//             shrinkWrap: true,
//             padding: const EdgeInsets.all(15),
//             gridDelegate: SliverQuiltedGridDelegate(
//               crossAxisCount: 4,
//               mainAxisSpacing: 12,
//               crossAxisSpacing: 8,
//               repeatPattern: QuiltedGridRepeatPattern.same,
//               pattern: [
//                 const QuiltedGridTile(2, 2),
//                 const QuiltedGridTile(2, 2),
//                 const QuiltedGridTile(2, 4),
//                 const QuiltedGridTile(4, 2),
//                 const QuiltedGridTile(2, 2),
//                 const QuiltedGridTile(2, 2),
//               ],
//             ),
//             childrenDelegate: SliverChildBuilderDelegate(
//               childCount: 1,
//               (context, index) => ItemDesign(index: index),
//             ),
//           );
//         }
//         ;
//       },
//     );