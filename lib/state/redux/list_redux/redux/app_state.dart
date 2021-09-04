import 'package:startup_namer/state/redux/list_redux/redux/list/list_state.dart';

class AppState {
  ListState listState;

  AppState({required this.listState});

  factory AppState.initial() {
    // 对于存在多个页面State情况，
    // 可以通过AppState(ListState.initial()， ListState2.initial()， ListState3.initial())这样的形式添加
    return AppState(
      listState: ListState.initial(),
    );
  }
}
