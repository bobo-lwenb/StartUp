import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:startup_namer/state/redux/demo/state_data.dart' as Play;

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StoreConnector<int, VoidCallback>(
        converter: (store) {
          return () {
            store.dispatch(Play.Actions.Increment);
            Navigator.of(context).pop();
          };
        },
        builder: (context, callback) {
          return OutlinedButton(
            onPressed: callback,
            child: Text('back'),
          );
        },
      ),
    );
  }
}
