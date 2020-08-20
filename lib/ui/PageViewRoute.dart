import 'package:flutter/material.dart';

class PageViewRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageViewState();
}

class _PageViewState extends State {
  int _currIndex = 0;
  PageController _controller;
  PageController _controller1;
  List<Widget> _pageList = [
    Container(
      color: Colors.blue,
      child: Text('qqqq'),
    ),
    Container(
      color: Colors.red,
      child: Text('qqqq'),
    ),
    Container(
      color: Colors.yellow,
      child: Text('qqqq'),
    ),
    Container(
      color: Colors.orange,
      child: Text('qqqq'),
    ),
  ];

  @override
  void initState() {
    _controller = PageController(
      initialPage: _currIndex,
      viewportFraction: 0.9,
    );
    _controller1 = PageController(
      initialPage: _currIndex,
      viewportFraction: 0.9,
    );
    _controller1.addListener(() {
      setState(() {
        _currPageValue = _controller1.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
      ),
      body: Column(
        children: [
          Container(
            height: 200.0,
            child: _buildCommonPageView(),
          ),
          Placeholder(
            fallbackHeight: 10.0,
          ),
          Container(
            height: 200.0,
            child: _buildFurtherPageView(),
          ),
          Placeholder(
            fallbackHeight: 10.0,
          ),
          Container(
            height: 200.0,
            child: _buildSpecialPageView(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _buildCommonPageView() {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: _controller,
      onPageChanged: (index) {},
      children: [
        _pageList[0],
        _pageList[1],
        _pageList[2],
        _pageList[3],
      ],
    );
  }

  Widget _buildFurtherPageView() {
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.loose,
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: 100,
          itemBuilder: (context, index) => _pageList[index % _pageList.length],
          onPageChanged: (index) {
            setState(() {
              _currIndex = index % _pageList.length;
            });
          },
        ),
        Positioned(
          bottom: 10.0,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pageList.length,
                    (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currIndex == index ? Colors.black87 : Colors.white,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }

  final _imgPath = 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2877516247,37083492&fm=26&gp=0.jpg';
  double _currPageValue = 0.0;
  double _scaleFactor = 0.9;

  Widget _buildSpecialPageView() {
    return PageView.builder(
      itemCount: 100,
      controller: _controller1,
      itemBuilder: (context, index) => _buildPageItem(index),
    );
  }

  _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      //当前的item
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = 200 * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _currPageValue.floor() + 1) {
      //右边的item
      var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = 200 * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _currPageValue.floor() - 1) {
      //左边
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = 200 * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else {
      //其他，不在屏幕显示的item
      matrix4 = Matrix4.diagonal3Values(1.0, _scaleFactor, 1.0)
        ..setTranslationRaw(0.0, 200 * (1 - _scaleFactor) / 2, 0.0);
    }

    return Transform(
        transform: matrix4,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(_imgPath), fit: BoxFit.fill),
            ),
          ),
        ),
    );
  }
}
