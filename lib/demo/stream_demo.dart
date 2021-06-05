import 'dart:async';

class StreamDemo {
  // 使用命名构造函数创建
  Stream periodicStream = Stream.periodic(const Duration(seconds: 2), (num) {
    return num;
  }).map((num) => num * 2);

  void listenPeriodicStream() {
    periodicStream.listen((event) {
      print(event);
    });
  }

  void broadcast() {
    Stream broadcastStream = Stream.periodic(const Duration(seconds: 2), (num) {
      return num;
    }).asBroadcastStream();

    var _controller = StreamController<int>.broadcast();
  }

  // 讲方法的返回值声明为 Stream
  Stream<String> timedCounter(Duration interval, [int maxCount]) async* {
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      yield "stream返回${i++}";
      if (i == maxCount) break;
    }
  }

  // 使用StreamController
  var _controller = StreamController<int>.broadcast();
  var _count = 1;
  createStream() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _controller.sink.add(_count);
      _count++;
    });
  }

  void listen() {
    _controller.stream.listen((event) {
      print(event);
    });
  }

  void stop() {
    _controller.close();
  }
}
