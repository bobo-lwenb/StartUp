import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:startup_namer/state/redux/list_redux/redux/app_state.dart';
import 'package:startup_namer/state/redux/list_redux/redux/list/list_action.dart';
import 'package:startup_namer/state/redux/list_redux/redux/list/list_middleware.dart';
import 'package:startup_namer/state/redux/list_redux/redux/list/list_state.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: StoreConnector<AppState, ListState>(
        // 初始化时加载列表
        onInit: (store) {
          if (!store.state.listState.isInit) {
            store.dispatch(fetchList);
          }
          // 将store中的state转化为viewModel
        },
        converter: (store) {
          // return viewmodel
          return store.state.listState;
          // 通过viewModel更新界面
        },
        builder: (contxet, listState) {
          // 根据状态显示界面
          if (!listState.isInit) {
            // 显示loading界面
            return _buildLoad();
          } else {
            // 显示列表界面
            List<String> list = listState.list;
            // return _buildList(list);
            return _buildScroll(list);
          }
        },
      ),
    );
  }

  Widget _buildLoad() {
    return Center(
      child: Text("正在加载中..."),
    );
  }

  Widget _buildList(List<String> list) {
    ListView listView = ListView.builder(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(list[index]),
          onTap: () {
            Store<AppState> store = StoreProvider.of<AppState>(context);
            store.dispatch(SelectItemAction(selected: list[index]));
            // 返回到上一级页面
            Navigator.pop(context);
          },
        );
      },
    );
    return listView;
  }

  Widget _buildScroll(List<String> list) {
    ListView listView = ListView.builder(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: list.length,
      itemBuilder: (context, index) {
        StoreConnector connector = StoreConnector<AppState, VoidCallback>(
          converter: (store) {
            return () {
              store.dispatch(SelectItemAction(selected: list[index]));
              Navigator.pop(context);
            };
          },
          builder: (context, callback) {
            return ListTile(
              title: Text(list[index]),
              onTap: callback,
            );
          },
        );
        return connector;
      },
    );
    return listView;
  }
}
