import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_namer/state/getx/getx_counter/counter_controller.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: GetXCounter());
  }
}

class GetXCounter extends StatelessWidget {
  const GetXCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: OutlinedButton(
          // 使用Obx(()=>每当改变计数时，就更新Text())。
          child: Obx(
            () {
              return Text("${controller.count}");
            },
          ),
          onPressed: () {
            // 用一个简单的Get.to()即可代替Navigator.push那8行，无需上下文！
            Get.to(NewCounterPage());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_outlined),
        onPressed: () {
          controller.increment();
        },
      ),
    );
  }
}

class NewCounterPage extends StatelessWidget {
  const NewCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
    final CounterController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('New Counter Page'),
      ),
      body: Center(
        child: Obx(() {
          return Text(
            "${controller.count}",
            style: TextStyle(fontSize: 32),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_outlined),
        onPressed: () {
          controller.increment();
        },
      ),
    );
  }
}
