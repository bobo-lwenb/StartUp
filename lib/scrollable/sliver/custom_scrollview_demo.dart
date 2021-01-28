import 'package:flutter/material.dart';

/// Sliver的简单使用
class CustomScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        //AppBar，包含一个导航栏
        SliverAppBar(
          pinned: true,
          // appbar 是否有最小的高度
          floating: false,
          // appbar 是否跟随滑动
          snap: false,
          // 自否自动展开收起。注意：snap为true的时候floating一定要为true，其他随意。
          expandedHeight: 250.0,
          // title: Text("SliverAppBar"),
          // centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Demo'),
            centerTitle: true,
            background: Image.asset(
              "./images/avatar.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            //Grid
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Grid按两列显示
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建子widget
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            },
            childCount: 50, //50个列表项
          ),
        ),
      ],
    );
  }
}
