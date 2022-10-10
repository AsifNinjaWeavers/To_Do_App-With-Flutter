import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/normalitemview.dart';
import 'package:to_do_app/note.dart';
import 'package:to_do_app/pinneditem.dart';

class HomeBodyDesign extends StatefulWidget {
  Color notetextcolor = Colors.black;
  HomeBodyDesign({required this.notetextcolor, super.key});

  @override
  State<HomeBodyDesign> createState() => _HomeBodyDesignState();
}

class _HomeBodyDesignState extends State<HomeBodyDesign> {
  Box<Note>? pinbox;
  Box<Note>? unpinbox;
  Color col = Colors.black;
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
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 15),
                alignment: Alignment.topLeft,
                child: pinbox?.isEmpty == false
                    ? const Text(
                        'Important Notes',
                        style: TextStyle(
                            color: Color.fromARGB(240, 28, 28, 99),
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
              ),
              PinnedItemView(notextextcolor: widget.notetextcolor),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20, top: 8),
                child: pinbox?.isEmpty == false
                    ? const Text(
                        'Normal Notes',
                        style: TextStyle(
                            color: Color.fromARGB(240, 28, 28, 99),
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20, top: 8),
                child: pinbox?.isEmpty == true
                    ? const Text(
                        'Notes',
                        style: TextStyle(
                            color: Color.fromARGB(240, 28, 28, 99),
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
              ),
              NormalItemView(notextextcolor: widget.notetextcolor),
            ],
          ),
        );
      },
    );
  }

  Future showPicker() {
    // raise the [showDialog] widget
    return showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: MaterialPicker(
            pickerColor: Colors.red,
            onColorChanged: ((value) {
              debugPrint(value.value.toString());
              col = Color(value.value);
            }),
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              setState(
                () {
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ],
      ),
      context: context,
    );
  }
}
