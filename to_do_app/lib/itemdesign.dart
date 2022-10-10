// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/note.dart';
import 'package:to_do_app/profile.dart';
import 'package:to_do_app/search.dart';
import 'package:to_do_app/viewnote.dart';

class ItemDesign extends StatefulWidget {
  final Box<Note> mainbox;
  final List<Note> notes;
  final int index;
  final Box<Note> supportbox;
  final Box<Profile> profile;

  ItemDesign(
      {required this.profile,
      required this.index,
      required this.notes,
      required this.mainbox,
      required this.supportbox,
      super.key});

  @override
  State<ItemDesign> createState() => _ItemDesignState();
}

class _ItemDesignState extends State<ItemDesign> {
  Box<Search>? searchbox;
  String pin = "Pin";
  Color? pickcolor;
  List<Note> t = [];

  @override
  void initState() {
    super.initState();
    searchbox = Hive.box<Search>('SearchBox');
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
                const EdgeInsets.only(right: 30, left: 20, top: 10, bottom: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.center,
                stops: const [0.001, 0.2],
                colors: [
                  Colors.white54,
                  Color(widget.notes[widget.index].color),
                ],
              ),
              boxShadow: [
                BoxShadow(
                    color: Color(widget.notes[widget.index].color),
                    blurRadius: 10.0,
                    blurStyle: BlurStyle.solid
                    // spreadRadius: 2.0,
                    ),
              ],
              color: Color(widget.notes[widget.index].color),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.mainbox.getAt(widget.index)!.title,
                    style: TextStyle(
                        color: widget.profile.isEmpty
                            ? Colors.black
                            : Color(widget.profile.getAt(0)!.notestextcolor),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    // textAlign: TextAlign.start,
                    // textDirection: TextDirection.RTL,
                  ),
                ),
                Text(
                  DateFormat.yMMMMd()
                      .format(widget.notes[widget.index].date)
                      .toString(),
                  style: TextStyle(
                      color: widget.profile.isEmpty
                          ? Colors.black
                          : Color(widget.profile.getAt(0)!.notestextcolor),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            // offset: Offset.fromDirection(0, -60),
            color: Colors.white54,
            onSelected: ((value) => {
                  if (value == 'delete')
                    {
                      widget.mainbox.deleteAt(widget.index),
                      seachbardelete(widget.notes[widget.index]),
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
                    },
                  if (value == "Color") {showPicker()}
                }),
            icon: Icon(
              Icons.more_vert,
              color: widget.profile.isEmpty
                  ? Colors.black
                  : Color(widget.profile.getAt(0)!.notestextcolor),
            ),
            position: PopupMenuPosition.under,
            padding: const EdgeInsets.all(4),
            itemBuilder: ((context) => [
                  const PopupMenuItem(
                    value: 'delete',
                    mouseCursor: MouseCursor.defer,
                    child: Text('Delete'),
                  ),
                  PopupMenuItem(value: pin, child: Text(pin)),
                  const PopupMenuItem(
                    value: 'Color',
                    child: Text(
                      "Pick Color",
                      style: TextStyle(color: Colors.black),
                    ),

                    // style: ElevatedButton.styleFrom(),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  void seachbardelete(Note str) {
    List<Search> allsearch = searchbox!.values.toList();
    List<int> key = searchbox!.keys.cast<int>().toList();
    for (int i = 0; i < allsearch.length; i++) {
      if (str.title == allsearch[i].note.title) {
        searchbox?.delete(key[i]);
      }
    }
  }

  Future showPicker() {
    pickcolor = Color(widget.notes[widget.index].color);
    return showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: MaterialPicker(
            pickerColor: pickcolor!,
            onColorChanged: ((value) => pickcolor = value),
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              setState(() {
                widget.notes[widget.index].color = pickcolor!.value;
                widget.mainbox.putAt(
                    widget.index,
                    Note(
                        title: widget.notes[widget.index].title,
                        notetext: widget.notes[widget.index].notetext,
                        date: widget.notes[widget.index].date,
                        id: widget.notes[widget.index].id,
                        color: pickcolor!.value,
                        pin: widget.notes[widget.index].pin));
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      context: context,
    );
  }
}
