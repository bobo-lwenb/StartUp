import 'package:startup_namer/state/redux/list_redux/redux/app_state.dart';
import 'package:startup_namer/state/redux/list_redux/redux/list/list_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  // 对于存在多个页面Reducer情况，
  // 可以通过AppState(listReducer(state.listState, action), listReducer2(state.listState2, action),
  // listReducer3(state.listState3, action))这样的形式添加
  return AppState(
    listState: listReducer(state.listState, action),
  );
}
