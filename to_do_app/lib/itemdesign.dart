import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemDesign extends StatelessWidget {
  final int index;
  const ItemDesign({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 47, 155, 140),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              child: Text(
            "How To Make Your Personal brand stand out online",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          Text(
            DateFormat.yMMMMd().format(DateTime.now()).toString(),
            style: const TextStyle(
                color: Colors.black, fontStyle: FontStyle.normal, fontSize: 15),
          )
        ],
      ),
    );
  }
}
