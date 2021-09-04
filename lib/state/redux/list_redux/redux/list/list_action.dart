// 加载列表
class FetchListAction {
  List<String> list;

  FetchListAction({required this.list});
}

// 选择列表
class SelectItemAction {
  String selected;

  SelectItemAction({required this.selected});
}
