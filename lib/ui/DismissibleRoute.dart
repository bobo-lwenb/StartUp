import 'package:flutter/material.dart';

/// listview item左右滑动操作
class DismissibleRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> itemDatas =
        new List<String>.generate(20, (i) => "Item ${i + 1}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissable'),
      ),
      body: ListView.builder(
        itemCount: itemDatas.length,
        itemBuilder: (context, index) {
          final item = itemDatas[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: Key(item),
            // We also need to provide a function that will tell our app
            // what to do after an item has been swiped away.
            onDismissed: (DismissDirection direction) {
              itemDatas.removeAt(index);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            // confirmDismiss: (DismissDirection direction) async {
            //   await showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return AlertDialog(
            //           title: const Text("Confirm"),
            //           content: const Text(
            //               "Are you sure you wish to delete this item?"),
            //           actions: <Widget>[
            //             FlatButton(
            //                 onPressed: () => {
            //                       itemDatas.removeAt(index),
            //                       Navigator.of(context).pop(true)
            //                     },
            //                 child: const Text("DELETE")),
            //             FlatButton(
            //               onPressed: () => Navigator.of(context).pop(false),
            //               child: const Text("CANCEL"),
            //             )
            //           ],
            //         );
            //       });
            // },
            background: Container(color: Colors.red),
            secondaryBackground: Container(
              color: Colors.green,
            ),
            child: ListTile(title: new Text('$item')),
          );
        },
      ),
    );
  }
}
