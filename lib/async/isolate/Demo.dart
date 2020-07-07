import 'dart:async';
import 'dart:isolate';

///双向传递
Isolate isolate;

loadData() async {
  //port1的调用者，以便接收Isolate端的port2
  ReceivePort receivePort1 = ReceivePort();
  // 通过spawn新建一个Isolate，绑定方法并传递app端port1
  isolate = await Isolate.spawn(dataLoader, receivePort1.sendPort); //spawn(port1)

  // 获取Isolate端回传的port2
  SendPort sendPort = await receivePort1.first;
  //把要做的任务从Isolate端的port2传递过去
  List dataList = await sendReceive(sendPort, 'https://jsonplaceholder.typicode.com/posts');
  print('dataList $dataList');
}

// Isolate端的处理方法
dataLoader(SendPort sendPort) async {
  //port2的调用者，以便接收app端的任务数据
  ReceivePort receivePort2 = ReceivePort();
  // 将Isolate端的port2传递给app端的port1调用者，以便app端可以给它发送消息
  sendPort.send(receivePort2.sendPort); // port1.send(port2);

  // 接收App端发来的消息，并进行处理，可以传key，参数，做区分处理等等
  await for (var msg in receivePort2) {
    String requestURL = msg[0];
    SendPort callbackPort = msg[1]; // port3
    print(requestURL);

    /// 假设处理任务
    final dataList = await Future.delayed(
      Duration(seconds: 5),
      () {
        return ['sdf', 'ggg'];
      },
    );
    // 回调返回值给app端的port3的调用者
    callbackPort.send(dataList);
  }
}

/// 创建自己的监听port，并且向新isolate发送消息
///
/// 为什么要创建port3呢？
///
/// 因为ReceivePort是Stream，只能监听一次，为了更好的隔离任务监听，所以就新建了个，
/// 而且尽量每个任务都自己写一个监听，彼此互不影响
Future sendReceive(SendPort sendPort, String url) {
  // port3的调用者，以便接收任务返回值
  ReceivePort receivePort3 = ReceivePort();
  // 发送任务数据到Isolate端的port2的调用者
  sendPort.send([url, receivePort3.sendPort]); //port2.send(tohandletask, port3);
  // 接收到任务返回值
  return receivePort3.first;
}

stop() {
  isolate.kill(priority: Isolate.immediate);
  isolate = null;
}

///****************************///
///单向传递
Isolate isolate1;
int i = 1;

void start() async {
  //接收消息的主Isolate的端口
  final receive = ReceivePort();
  isolate1 = await Isolate.spawn(runTimer, receive.sendPort);

  receive.listen((data) {
    print("Reveive : $data ; i :$i");
  });
}

void runTimer(SendPort port) {
  int counter = 0;
  Timer.periodic(const Duration(seconds: 1), (_) {
    counter++;
    i++;
    final msg = "nitification $counter";
    print("Send :$msg ;i :$i");
    port.send(msg);
  });
}

stop1() {
  isolate1.kill(priority: Isolate.immediate);
  isolate1 = null;
}
