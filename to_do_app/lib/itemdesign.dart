import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/note.dart';
import 'package:to_do_app/viewnote.dart';

class ItemDesign extends StatefulWidget {
  final Box<Note> mainbox;
  final List<Note> notes;
  final int index;
  final Box<Note> supportbox;

  const ItemDesign(
      {required this.index,
      required this.notes,
      required this.mainbox,
      required this.supportbox,
      super.key});

  @override
  State<ItemDesign> createState() => _ItemDesignState();
}

class _ItemDesignState extends State<ItemDesign> {
  String pin = "Pin";

  List<Note> t = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.notes[widget.index].pin) {
      pin = "Unpin";
    } else {
      pin = "Pin";
    }
    return GestureDetector(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ViewNote(
                  note: widget.notes[widget.index],
                );
              },
            ),
          )),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            padding:
                const EdgeInsets.only(right: 30, left: 10, top: 10, bottom: 5),
            decoration: BoxDecoration(
              color: Color(widget.notes[widget.index].color),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    widget.notes[widget.index].title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    // textAlign: TextAlign.start,
                    // textDirection: TextDirection.RTL,
                  ),
                ),
                Text(
                  DateFormat.yMMMMd()
                      .format(widget.notes[widget.index].date)
                      .toString(),
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            // offset: Offset.fromDirection(0, -60),
            onSelected: ((value) => {
                  if (value == 'delete')
                    {
                      widget.mainbox.deleteAt(widget.index),
                    },
                  if (value == 'Pin')
                    {
                      setState(() {
                        widget.notes[widget.index].pin = true;

                        widget.supportbox.add(widget.notes[widget.index]);
                        widget.mainbox.deleteAt(widget.index);
                      })
                    },
                  if (value == 'Unpin')
                    {
                      setState(() {
                        widget.notes[widget.index].pin = false;
                        widget.supportbox.add(widget.notes[widget.index]);
                        widget.mainbox.deleteAt(widget.index);
                      })
                    }
                }),
            position: PopupMenuPosition.under,
            padding: const EdgeInsets.all(4),
            itemBuilder: ((context) => [
                  const PopupMenuItem(
                    value: 'delete',
                    mouseCursor: MouseCursor.defer,
                    child: Text('Delete'),
                  ),
                  PopupMenuItem(value: pin, child: Text(pin)),
                ]),
          ),
        ],
      ),
    );
  }
}
