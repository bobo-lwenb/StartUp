import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// 目录操作
handleDir() async {
  // 可以用Platform.pathSeparator代替路径中的分隔符"/"
  // 效果和"dir/subdir"一样
  // 如果有子文件夹，需要设置recursive: true
  var directory = await Directory("dir${Platform.pathSeparator}one").create(recursive: true);

  assert(await directory.exists() == true);

  // 绝对路径
  var absolutepath = directory.absolute.path;

  // 重命名文件夹
  directory = await directory.rename("dir/subdir");
  absolutepath = directory.absolute.path;

  // 创建临时文件夹
  // 参数是文件夹的前缀，后面会自动添加随机字符串
  // 参数可以是空参数
  var tempDir = await Directory.systemTemp.createTemp('temp_dir');
  assert(await tempDir.exists() == true);
  var tempDirPath = tempDir.path;

  // 返回上一级文件夹
  var parentDir = directory.parent;
  var parentDirPath = parentDir.path;

  // 列出所有文件，不包括链接和子文件夹
  Stream<FileSystemEntity> entityList = parentDir.list(recursive: false, followLinks: false);
  await for (FileSystemEntity entity in entityList) {
    // 文件、目录和链接都继承自FileSystemEntity
    // FileSystemEntity.type静态函数返回值为FileSystemEntityType
    // FileSystemEntityType有三个常量：
    // Directory、FILE、LINK、NOT_FOUND
    // FileSystemEntity.isFile .isLink .isDerectory可用于判断类型
    print(entity.path);
  }

  // 删除目录
  await tempDir.delete();
  assert(await tempDir.exists() == false);
}

/// 文件操作
handleFile() async {
  File file = File('hello.txt');
  if (await file.exists() == false) {
    file = await file.create();
  }
  print(file);

  // 直接调用File的writeAs函数时
  // 默认文件打开方式为WRITE:如果文件存在，会将原来的内容覆盖
  // 如果不存在，则创建文件

  // 写入String，默认将字符串以UTF8进行编码
  file = await file.writeAsString("[General]\nCode=UTF8");

  // readAsString读取文件，并返回字符串
  // 默认返回的String编码为UTF8
  // 相关的编解码器在dart:convert包中
  // 包括以下编解码器：ASCII、LANTI1、BASE64、UTF8、SYSTEM_ENCODING
  // SYSTEM_ENCODING可以自动检测并返回当前系统编码
  var string = await file.readAsString();

  // 如果是以字节方式写入文件
  // 建议设置好编码，避免汉字、特殊符号等字符出现乱码、或无法读取
  // 将字符串编码为Utf8格式，然后写入字节
  file = await file.writeAsBytes(utf8.encode("编码=UTF8"));
  //读取字节，并用Utf8解码
  print(utf8.decode(await file.readAsBytes()));

  // 以行为单位读取文件到List<String>，默认为UTF8编码
  List<String> lines = await file.readAsLines();
  lines.forEach(
    (String line) => print(line),
  );

  // 文件模式设置为追加
  IOSink sink = file.openWrite(mode: FileMode.append);

  // 多次写入
  sink.write('A woman is like a tea bag');
  sink.writeln('you never know how strong it is until it\'s in hot water.');
  sink.writeln('-Eleanor Roosevelt');
  await sink.close();

  //把文件转换成流
  Stream<List<int>> inputStream = file.openRead();
  inputStream
      .transform(utf8.decoder) //解码为UTF8
      .transform(new LineSplitter()) //流转换为列表
      .listen(
    (String line) {
      print('$line有${line.length}个字节');
    },
    onDone: () {
      print('文件已关闭');
    },
    onError: (e) {
      print(e.toString());
    },
  );

  // 删除文件
  await file.delete();
}
