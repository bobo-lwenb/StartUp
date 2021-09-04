import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:startup_namer/state/redux/demo/new_page.dart';
import 'package:startup_namer/state/redux/demo/state_data.dart' as Play;
import 'package:redux/redux.dart';

class ReduxDemo extends StatefulWidget {
  ReduxDemo({Key? key}) : super(key: key);

  @override
  _ReduxDemoState createState() => _ReduxDemoState();
}

class _ReduxDemoState extends State<ReduxDemo> {
  final Store<int> _store = Store<int>(
    Play.counterReducer,
    initialState: 0,
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: _store,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Theme.of(context).primaryColor,
        ),
        home: ReduxTest(),
      ),
    );
  }
}

class ReduxTest extends StatefulWidget {
  const ReduxTest({Key? key}) : super(key: key);

  @override
  _ReduxTestState createState() => _ReduxTestState();
}

class _ReduxTestState extends State<ReduxTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('简单使用')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StoreConnector<int, String>(
              converter: (store) => store.state.toString(),
              builder: (context, count) {
                print("$count");
                return Text(
                    'The button has been pushed this many times: $count');
              },
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewPage();
                }));
              },
              child: Text('next page'),
            ),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<int, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(Play.Actions.Increment);
        },
        builder: (context, callback) {
          return FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
