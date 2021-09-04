import 'list_action.dart';
import 'list_state.dart';

ListState listReducer(ListState pre, dynamic action) {
  if (action is FetchListAction) {
    return ListState(
      init: true,
      list: action.list,
      selectedText: pre.selectedText,
    );
  }
  if (action is SelectItemAction) {
    return ListState(
      init: pre.isInit,
      list: pre.list,
      selectedText: action.selected,
    );
  }
  return pre;
}
