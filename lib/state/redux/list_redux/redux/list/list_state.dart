import 'dart:collection';

class ListState {
  bool init = false; // 列表初始化标志
  List<String> list = []; // 列表数据
  String selectedText = ''; // 选中的列表项

  ListState({
    required this.init,
    required this.list,
    required this.selectedText,
  });

  factory ListState.initial() {
    return ListState(
      init: false,
      list: [],
      selectedText: "未选中",
    );
  }

  bool get isInit => init;

  UnmodifiableListView<String> get lists => UnmodifiableListView(list);

  String get isSelected => selectedText;
}
