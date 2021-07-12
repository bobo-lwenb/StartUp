import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class AnimatedListRoute extends StatefulWidget {
  const AnimatedListRoute({Key? key}) : super(key: key);

  @override
  _AnimatedListRouteState createState() => _AnimatedListRouteState();
}

class _AnimatedListRouteState extends State<AnimatedListRoute> {
  final GlobalKey<AnimatedListState> _globalKey =
      GlobalKey<AnimatedListState>();
  final List<String> _data = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    List<String> array =
        generateWordPairs().take(5).map((e) => e.asPascalCase).toList();
    _data.addAll(array);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedList'),
      ),
      body: AnimatedList(
        key: _globalKey,
        itemBuilder: (context, index, animation) => ListItem(
          text: _data[index],
          index: index,
          animation: animation,
        ),
        initialItemCount: _data.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String word =
              generateWordPairs().take(1).map((e) => e.asPascalCase).first;
          _data.add(word);
          _globalKey.currentState?.insertItem(
            _data.length - 1,
            duration: const Duration(milliseconds: 200),
          );
        },
        child: Icon(Icons.add_outlined),
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  final String text;
  final int index;
  final Animation animation;

  ListItem({
    Key? key,
    required this.text,
    required this.index,
    required this.animation,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  Tween<Offset> _tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    Widget text = Center(
      child: Text(
        widget.text,
        style: TextStyle(color: Colors.white),
      ),
    );
    Widget delete = GestureDetector(
      onTap: () {
        context
            .findAncestorStateOfType<_AnimatedListRouteState>()!
            ._data
            .removeAt(widget.index);
        context.findAncestorStateOfType<AnimatedListState>()?.removeItem(
              widget.index,
              (context, animation) => ListItem(
                  text: widget.text, index: widget.index, animation: animation),
              duration: const Duration(milliseconds: 200),
            );
      },
      child: Icon(
        Icons.delete_forever_rounded,
        color: Colors.white,
      ),
    );
    Widget flex = Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: text,
        ),
        Expanded(
          child: delete,
        )
      ],
    );
    Widget item = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        color: Colors.primaries[widget.index % Colors.primaries.length],
        child: flex,
      ),
    );
    return SlideTransition(
      position: widget.animation.drive(_tween),
      child: item,
    );
  }
}
