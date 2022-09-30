import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/note.dart';
import 'package:to_do_app/viewnote.dart';

class ItemDesign extends StatefulWidget {
  final Box<Note> pinbox;
  final List<Note> notes;
  final int index;
  final Box<Note> unpinbox;

  ItemDesign(
      {required this.index,
      required this.notes,
      required this.pinbox,
      required this.unpinbox,
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
                const EdgeInsets.only(right: 30, left: 10, top: 10, bottom: 15),
            decoration: BoxDecoration(
              color: Color(widget.notes[widget.index].color),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.notes[widget.index].title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  // textAlign: TextAlign.start,
                  // textDirection: TextDirection.RTL,
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
                      widget.unpinbox.deleteAt(widget.index),
                    },
                  if (value == 'Pin')
                    {
                      setState(() {
                        // pin = "Unpin";
                        widget.notes[widget.index].pin = true;

                        // t = pinhelp(
                        //   list: widget.notes,
                        //   index: widget.index,
                        //   note: widget.notes[widget.index],
                        //   size: widget.notes.length,
                        // );
                        // widget.box.deleteAll(widget.box.keys);
                        // widget.box.addAll(t);
                        widget.pinbox.add(widget.notes[widget.index]);
                        widget.unpinbox.deleteAt(widget.index);
                      })
                    },
                  if (value == 'Unpin')
                    {
                      setState(() {
                        // pin = "pin";
                        widget.notes[widget.index].pin = false;
                        widget.unpinbox.add(widget.notes[widget.index]);
                        widget.pinbox.deleteAt(widget.index);
                        // t = unpinhelp(
                        //   list: widget.notes,
                        //   index: widget.index,
                        //   note: widget.notes[widget.index],
                        //   size: widget.notes.length,
                        // );
                        // widget.box.deleteAll(widget.box.keys);
                        // widget.box.addAll(t);
                      })
                    }
                }),
            position: PopupMenuPosition.under,
            padding: EdgeInsets.all(4),
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                    mouseCursor: MouseCursor.defer,
                  ),
                  PopupMenuItem(value: pin, child: Text(pin)),
                ]),
          ),
        ],
      ),
    );
  }

  List<Note> pinhelp(
      {required List<Note> list,
      required Note note,
      required int size,
      required int index}) {
    List<Note> temp = [];
    temp.add(note);
    int i = 0;
    while (i < size) {
      if (i != index) {
        temp.add(list[i]);
      }
      i++;
    }
    return temp;
  }

  List<Note> unpinhelp(
      {required List<Note> list,
      required Note note,
      required int size,
      required int index}) {
    List<Note> temp = [];

    int i = 0;
    while (i < size) {
      if (i != index) {
        temp.add(list[i]);
      }
      i++;
    }
    temp.add(note);
    return temp;
  }
}
  // int getcolor() {
  //   if (notes[index].color == null) {
  //     return 0xff1e7ed9b;
  //   }
  //   return notes[index].color;
  // }

