import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:to_do_app/itemdesign.dart';
import 'package:to_do_app/note.dart';

class ItemView extends StatefulWidget {
  const ItemView({super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  Box<Note>? box;
  List<Note>? notes;
  @override
  void initState() {
    super.initState();
    box = Hive.box<Note>('box');
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: box!.listenable(),
      builder: (BuildContext context, value, _) {
        return GridView.custom(
          // shrinkWrap: true,
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 8,
            repeatPattern: QuiltedGridRepeatPattern.same,
            pattern: [
              const QuiltedGridTile(2, 2),
              const QuiltedGridTile(2, 2),
              const QuiltedGridTile(2, 4),
              const QuiltedGridTile(4, 2),
              const QuiltedGridTile(2, 2),
              const QuiltedGridTile(2, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: value.length,
            (context, index) => ItemDesign(
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