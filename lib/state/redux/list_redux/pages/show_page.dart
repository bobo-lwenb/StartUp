import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:startup_namer/state/redux/list_redux/redux/app_state.dart';
import 'package:startup_namer/state/redux/list_redux/redux/store.dart';

import 'list_page.dart';

class ShowText extends StatelessWidget {
  const ShowText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Store<AppState> store = createStore();
    // 使用 StoreProvider 作为根布局
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          home: ShowPage(),
        ));
  }
}

class ShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StoreConnector connector = StoreConnector<AppState, String>(
      converter: (store) => store.state.listState.selectedText,
      builder: (context, selectedText) {
        return Text(selectedText);
      },
    );
    ElevatedButton button = ElevatedButton(
      child: Text(
        '前往列表',
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ListPage();
          },
        ),
      ),
    );
    Column column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        connector,
        Padding(
          padding: EdgeInsets.all(10.0),
          child: button,
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Show'),
      ),
      body: Center(
        child: column,
      ),
    );
  }
}
