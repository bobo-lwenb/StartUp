import 'package:flutter/material.dart';

class ButtonDemo extends StatefulWidget {
  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    DropdownButton dropdownButton = DropdownButton(
      items: [
        DropdownMenuItem(child: Text("Tom")),
        DropdownMenuItem(child: Text("Jack")),
        DropdownMenuItem(child: Text("Tim")),
        DropdownMenuItem(child: Text("John")),
        DropdownMenuItem(child: Text("David")),
      ],
      onChanged: (value) {},
    );
    PopupMenuButton popupMenuButton = PopupMenuButton(
      itemBuilder: (context) {
        return <PopupMenuItem<String>>[
          PopupMenuItem(
            value: "0",
            child: Text("Item 1"),
          ),
          PopupMenuItem(
            value: "1",
            child: Text("Item 2"),
          ),
          PopupMenuItem(
            value: "02",
            child: Text("Item 3"),
          ),
          PopupMenuItem(
            value: "3",
            child: Text("Item 4"),
          ),
        ];
      },
    );
    IconButton iconButton = IconButton(
      icon: Icon(Icons.show_chart_rounded),
      onPressed: _showMenu,
    );
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 255,
            title: Text("Button"),
          ),
        ];
      },
      body: Column(
        children: [
          dropdownButton,
          popupMenuButton,
          iconButton,
        ],
      ),
    );
  }

  void _showMenu() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(500, 75, 10, 0),
      items: <PopupMenuItem<String>>[
        PopupMenuItem(
          value: "0",
          child: Text("Item 1"),
        ),
        PopupMenuItem(
          value: "1",
          child: Text("Item 2"),
        ),
        PopupMenuItem(
          value: "02",
          child: Text("Item 3"),
        ),
        PopupMenuItem(
          value: "3",
          child: Text("Item 4"),
        ),
      ],
    );
  }
}
