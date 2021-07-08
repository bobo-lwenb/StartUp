import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PersistentHeader extends StatefulWidget {
  const PersistentHeader({Key key}) : super(key: key);

  @override
  _PersistentHeaderState createState() => _PersistentHeaderState();
}

class _PersistentHeaderState extends State<PersistentHeader> {
  final Dio _dio = Dio();
  final ValueNotifier _valueNotifier =
      ValueNotifier<Map<String, List<Member>>>(<String, List<Member>>{});

  @override
  void initState() {
    super.initState();
    var options = BaseOptions(
      baseUrl: 'https://h5.48.cn/resource/jsonp/allmembers.php?gid=10',
      receiveTimeout: 10000,
      connectTimeout: 10000,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.plain,
    );
    _dio.options = options;
  }

  @override
  Widget build(BuildContext context) {
    ValueListenableBuilder builder = ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder: (context, value, child) {
        var map = value as Map<String, List<Member>>;
        List<Widget> widgets = List.empty(growable: true);
        map.forEach((key, value) {
          widgets.add(_buildHeader(key));
          widgets.add(_buildList(value));
        });
        CustomScrollView scrollView = CustomScrollView(
          slivers: widgets,
        );
        return scrollView;
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('PersistentHeader'),
      ),
      body: builder,
      floatingActionButton: FloatingActionButton(
        onPressed: () => getData(),
        child: Icon(Icons.refresh_outlined),
      ),
    );
  }

  SliverPersistentHeader _buildHeader(String title) {
    SliverPersistentHeader header = SliverPersistentHeader(
      delegate: _MyDelegate(title: title),
      floating: false,
      pinned: true,
    );
    return header;
  }

  SliverList _buildList(List<Member> list) {
    SliverList sliverList = SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          Member member = list[index];
          return ListTile(
            leading: ClipOval(
              child: CircleAvatar(
                child: Image.network(member.avatarUrl),
                backgroundColor: Colors.white,
                radius: 32,
              ),
            ),
            trailing: Text(member.team),
            title: Text(member.name),
            subtitle: Text(member.id),
          );
        },
        childCount: list.length,
      ),
    );
    return sliverList;
  }

  void getData() async {
    Response response = await _dio.get('');
    if (response.statusCode != 200) return;
    var data = jsonDecode(response.data.toString());
    List<Member> members = data['rows'].map<Member>((row) {
      return Member(
        id: row['sid'],
        name: row['sname'],
        team: row['tname'],
      );
    }).toList();
    _valueNotifier.value = _groupData(members);
  }

  Map<String, List<Member>> _groupData(List<Member> data) {
    var map = Map<String, List<Member>>();
    data.forEach((element) {
      if (map.keys.contains(element.team)) {
        map[element.team].add(element);
      } else {
        var list = <Member>[];
        list.add(element);
        map[element.team] = list;
      }
    });
    return map;
  }
}

class _MyDelegate extends SliverPersistentHeaderDelegate {
  final String title;

  _MyDelegate({this.title});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 32,
      color: Colors.accents[4],
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  double get maxExtent => 32;

  @override
  double get minExtent => 32;

  @override
  bool shouldRebuild(covariant _MyDelegate oldDelegate) =>
      oldDelegate.title != title;
}

class Member {
  final String id;
  final String name;
  final String team;

  String get avatarUrl => "https://www.snh48.com/images/member/zp_$id.jpg";

  Member({
    this.id,
    this.name,
    this.team,
  });

  @override
  String toString() => "$id - $name";
}
