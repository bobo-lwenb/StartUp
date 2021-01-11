import 'package:flutter/material.dart';
import 'package:startup_namer/events/ScrollNotificationTestRoute.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'DragTestRoute.dart';
import 'GestureDetectorTestRoute.dart';
import 'GestureRecognizerTestRoute.dart';
import 'PointerEventTestRoute.dart';
import 'ScaleTestRoute.dart';
import 'notification/NotificationRoute.dart';

class EventsMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EventsMainState();
}

class _EventsMainState extends State<EventsMain> {
  List<ItemData> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    list.add(ItemData('原始指针事件PointerEvent', PointerEventTestRoute()));
    list.add(ItemData('手势GestureDetector', GestureDetectorTestRoute()));
    list.add(ItemData('拖动缩放事件', DragTestRoute()));
    list.add(ItemData('监听缩放事件', ScaleTestRoute()));
    list.add(ItemData('手势识别器', GestureRecognizerTestRoute()));
    list.add(ItemData('通知冒泡', NotificationRoute()));
    list.add(ItemData('ScrollNotification用法', ScrollNotificationTestRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('事件通知'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
