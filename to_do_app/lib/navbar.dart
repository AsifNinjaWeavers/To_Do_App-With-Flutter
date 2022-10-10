import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/profile.dart';

class NavDrawer extends StatefulWidget {
  Color? pickcolor;
  NavDrawer({required this.pickcolor});
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  Box<Profile>? profile;
  @override
  void initState() {
    super.initState();
    profile = Hive.box<Profile>('ProfilBox');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            margin: EdgeInsets.only(top: 35),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assest/images/emoji.jpg'))),
            child: Text(
              '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Edit Notes Text Color'),
            onTap: () => {
              showPicker(),
            },
          ),
        ],
      ),
    );
  }

  Future showPicker() async {
    Color col = Colors.black;
    return showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: MaterialPicker(
            pickerColor: widget.pickcolor!,
            onColorChanged: ((value) => col = value),
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              debugPrint(widget.pickcolor?.value.toString());
              setState(
                () {
                  profile!.isEmpty
                      ? profile!.add(Profile(notestextcolor: col.value))
                      : profile!.putAt(0, Profile(notestextcolor: col.value));
                  widget.pickcolor = col;
                },
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      context: context,
    );
  }
}
