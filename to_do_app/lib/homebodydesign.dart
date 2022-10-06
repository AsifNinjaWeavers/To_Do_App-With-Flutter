import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/normalitemview.dart';
import 'package:to_do_app/note.dart';
import 'package:to_do_app/pinneditem.dart';

class HomeBodyDesign extends StatefulWidget {
  const HomeBodyDesign({super.key});

  @override
  State<HomeBodyDesign> createState() => _HomeBodyDesignState();
}

class _HomeBodyDesignState extends State<HomeBodyDesign> {
  Box<Note>? pinbox;
  Box<Note>? unpinbox;
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
                child: pinbox?.isEmpty == false
                    ? const Text(
                        'Importent Notes',
                        style: TextStyle(color: Colors.white60, fontSize: 20),
                        textDirection: TextDirection.ltr,
                      )
                    : const SizedBox(),
              ),
              const PinnedItemView(),
              Container(
                child: pinbox?.isEmpty == false
                    ? const Divider(
                        height: 8,
                        thickness: 2,
                        color: Colors.white60,
                      )
                    : const SizedBox(),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: pinbox?.isEmpty == false
                    ? const Text(
                        'Normal Notes',
                        style: TextStyle(color: Colors.white60, fontSize: 20),
                        textDirection: TextDirection.ltr,
                      )
                    : SizedBox(),
              ),
              const NormalItemView(),
            ],
          ),
        );
      },
    );
  }
}
