import 'package:flutter/material.dart';

class DrawerMain extends StatefulWidget {
  DrawerMain({Key? key}) : super(key: key);

  @override
  _DrawerMainState createState() => _DrawerMainState();
}

class _DrawerMainState extends State<DrawerMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ExpansionTile(
            title: Text("Avaibility"),
            children: [],
          )
        ],
      ),
    );
  }
}
