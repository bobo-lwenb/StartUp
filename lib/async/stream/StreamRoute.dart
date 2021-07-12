import 'dart:async';

import 'package:flutter/material.dart';

class StreamRoute extends StatefulWidget {
  @override
  _StreamRouteState createState() => _StreamRouteState();
}

class _StreamRouteState extends State<StreamRoute> {
  @override
  void initState() {
    _singleStream();
    _broadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Demo'),
      ),
    );
  }

  void _singleStream() {
    /// 单Stream
    StreamController<int> controller = StreamController();
    StreamSubscription subscription = controller.stream
        .where(
          (value) => value % 2 == 0,
        )
        .transform(
          StreamTransformer.fromHandlers(
            handleData: (int data, EventSink sink) {
              sink.add(data + 1);
            },
          ),
        )
        .map(
          (value) => 'the value id $value',
        )
        .listen(
          (value) => print(value),
        );

    controller.sink.add(0);
    controller.sink.add(1);
    controller.sink.add(2);
    controller.sink.add(3);
    controller.sink.add(4);

    subscription.cancel();
    controller.close();
  }

  void _broadcastStream() {
    /// 广播Stream
    StreamController controller = StreamController.broadcast();
    StreamSubscription sub1 =
        controller.stream.listen((value) => 'sub1: $value');
    controller.sink.add(1);
    controller.sink.add(2);

    StreamSubscription sub2 =
        controller.stream.listen((value) => 'sub2: $value');
    controller.sink.add(3);
    controller.sink.add(4);

    sub1.cancel();
    sub2.cancel();
    controller.close();
  }
}

/// 自定义一个 StreamTransformer ，
/// 泛型类型 S 为入参类型，T 为出参类型
/// 这些类型都是 Stream 中传递的数据类型
class _MyTransformer<S, T> implements StreamTransformer<S, T> {
  // 用来生成一个新的 Stream 并且控制符合条件的数据
  StreamController? _controller;

  StreamSubscription? _subscription;

  bool? cancelOrError;

  // 转换之前的 Stream
  Stream<S>? _stream;

  _MyTransformer({bool sync: false, this.cancelOrError}) {
    _controller = new StreamController<T>(
        onListen: _onListen,
        onCancel: _onCancel,
        onPause: () {
          _subscription?.pause();
        },
        onResume: () {
          _subscription?.resume();
        },
        sync: sync);
  }

  _MyTransformer.broadcast({bool sync: false, this.cancelOrError}) {
    // 定义一个 StreamController，注意泛型类型为 T，也就是出参类型，因为
    // 我们是使用该 _controller 生成一个用来返回的新的 Stream<T>
    _controller = new StreamController<T>.broadcast(
        onListen: _onListen, onCancel: _onCancel, sync: sync);
  }

  void _onListen() {
    // _stream 为转换之前的 Stream<S>
    _subscription = _stream?.listen(onData,
        onError: _controller?.addError,
        onDone: _controller?.close,
        cancelOnError: cancelOrError);
  }

  void _onCancel() {
    _subscription?.cancel();
    _subscription = null;
    _controller?.close();
  }

  // 数据转换
  void onData(S data) {
    if ((data as int) % 2 == 0) {
      // 将符合条件的数据添加到新的 Stream 中
      _controller?.sink.add(data);
    }
  }

  // 参数为转换之前的 Stream<S>
  // 返回的是一个新的 Stream<T> （转换之后的 Stream）
  @override
  Stream<T> bind(Stream<S> stream) {
    this._stream = stream;
    return _controller?.stream as Stream<T>;
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() {
    return null as StreamTransformer<RS, RT>;
  }
}
