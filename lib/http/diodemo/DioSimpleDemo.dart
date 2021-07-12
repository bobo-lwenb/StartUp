import 'dart:async';

import 'package:dio/dio.dart';

class DioSimpleDemo {
  late Dio _dio;

  DioSimpleDemo() {
    _dio = Dio();
  }

  simpleDemo() async {
    /// get
    Response response = await _dio.get("/test?id=12&name=wendu");
    // 请求参数也可以通过对象传递，上面的代码等同于：
    response =
        await _dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
    print(response.data.toString());

    /// post
    Response response1 =
        await _dio.post("/test", data: {"id": 12, "name": "wendu"});

    /// 发起多个并发请求
    List<Response> response2 =
        await Future.wait([_dio.post("/info"), _dio.get("/token")]);

    /// 下载文件
    Response response3 =
        await _dio.download("https://www.google.com/", "./xx.html");

    /// 以流的方式接收响应数据
    Response<ResponseBody> response4 = await _dio.post<ResponseBody>(
      "url",
      options: Options(responseType: ResponseType.stream),
    );

    /// 以二进制数组的方式接收响应数据
    Response<List<int>> rs = await Dio().get<List<int>>(
      "url",
      options: Options(responseType: ResponseType.bytes), //设置接收类型为bytes
    );

    /// 发送 FormData
    FormData formData = FormData.fromMap({
      "name": "wendux",
      "age": 25,
    });
    Response response5 = await _dio.post("url", data: formData);

    /// 通过FormData上传多个文件
    FormData formData1 = FormData.fromMap({
      "name": "wendux",
      "age": 25,
      "file":
          await MultipartFile.fromFile("./text.txt", filename: "upload.txt"),
      "files": [
        await MultipartFile.fromFile("./text1.txt", filename: "text1.txt"),
        await MultipartFile.fromFile("./text2.txt", filename: "text2.txt"),
      ]
    });
    Response response6 = await _dio.post("url", data: formData1);

    /// 以流的形式提交二进制数据，并监听进度
    List<int> postData = <int>[1, 2, 3, 4, 5, 6];
    Response response7 = await _dio.post(
      "http://www.dtworkroom.com/doris/1/2.0.0/test",
      data: Stream.fromIterable(postData.map((e) => [e])),
      options: Options(
        headers: {
          Headers.contentLengthHeader: postData.length, // 设置content-length
        },
      ),
      onSendProgress: (int sent, int total) {
        print("$sent $total");
      },
    );
  }
}
