import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  final List<ItemData> widgets;

  GridViewWidget({
    Key key,
    @required this.widgets,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.widgets.length,
        itemBuilder: (context, index) {
          var data = widget.widgets[index];
          return _widget(data.text, data.widget);
        },
      ),
    );
  }

  Widget _widget(String text, Widget page) {
    return OutlineButton(
      child: Text(text),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ),
        );
      },
    );
  }
}

class ItemData {
  String text;
  Widget widget;

  ItemData(this.text, this.widget);
}
