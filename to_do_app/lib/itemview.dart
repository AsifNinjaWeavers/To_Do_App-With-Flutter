import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:to_do_app/itemdesign.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
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
        childCount: 20,
        (context, index) => ItemDesign(index: index),
      ),
    );
  }
}
