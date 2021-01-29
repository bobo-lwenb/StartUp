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
            value: "2",
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
          _buildTextButton(),
          _buildFlatButton(),
          _buildOutlinedButton(),
          _buildOutlineButton(),
          _buildElevatedButton(),
          _buildRasedButton(),
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
          value: "2",
          child: Text("Item 3"),
        ),
        PopupMenuItem(
          value: "3",
          child: Text("Item 4"),
        ),
      ],
    );
  }

  ButtonStyle style;

  @override
  void initState() {
    style = ButtonStyle(
      //设置颜色无效
      textStyle: MaterialStateProperty.all(
        TextStyle(fontSize: 18, color: Colors.red),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            ////按下时的颜色
            return Colors.blue;
          }
          //默认状态使用灰色
          return Colors.black;
        },
      ),
      overlayColor: MaterialStateProperty.all(Colors.purpleAccent[100]),
    );
    super.initState();
  }

  Widget _buildTextButton() {
    return TextButton(
      onPressed: () {},
      child: Text("TextButton"),
      style: style,
    );
  }

  Widget _buildFlatButton() {
    return FlatButton(
      onPressed: () {},
      child: Text("FlatBuuton"),
    );
  }

  Widget _buildOutlinedButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Text("OutlinedButton"),
      style: style,
    );
  }

  Widget _buildOutlineButton() {
    return OutlineButton(
      onPressed: () {},
      child: Text("OutlineButton"),
    );
  }

  Widget _buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("ElevatedButton"),
      style: style,
    );
  }

  Widget _buildRasedButton() {
    return RaisedButton(
      onPressed: () {},
      child: Text("RaisedButton"),
    );
  }
}
