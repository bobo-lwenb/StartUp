import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePictureRoute extends StatefulWidget {
  @override
  _TakePictureRouteState createState() => new _TakePictureRouteState();
}

class _TakePictureRouteState extends State<TakePictureRoute> {
  List<PickedFile> _pics = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('选择照片'),
      ),
      body: new Center(
//        child: _pic == null ? new Text('未选择图片') : Image.file(_pic),
        child: new Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _genPics(),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _showBottomDia(),
        child: Icon(Icons.add_a_photo),
        tooltip: 'Pick Picture',
      ),
    );
  }

  _showBottomDia() {
    showModalBottomSheet(
        context: context,
        builder: (context) => new Container(
              height: 120,
              child: new Column(
                children: <Widget>[
                  _item('拍照', 0),
                  _item('从相册选择', 1),
                ],
              ),
            ));
  }

  _item(String title, int index) {
    return new GestureDetector(
      child: ListTile(
        leading: Icon(index == 0 ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => _getPic(index),
      ),
    );
  }

  Future _getPic(int index) async {
    Navigator.pop(context);
    PickedFile? image = await ImagePicker().getImage(
        source: index == 0 ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      _pics.add(image!);
    });
  }

  _genPics() {
    return _pics.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              File(file.path),
              width: 120,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Icon(Icons.close, size: 18, color: Colors.white),
                ),
              ),
              onTap: () {
                setState(() {
                  _pics.remove(file);
                });
              },
            ),
          ),
        ],
      );
    }).toList();
  }
}
