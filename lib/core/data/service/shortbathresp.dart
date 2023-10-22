import 'package:dio/dio.dart';
import 'package:herry_up/core/data/model/shortestpathmodel.dart';
import 'package:herry_up/task3/view/guide_page.dart';

var x = "";

ShortestPath(String sourceName, String targetName) async {
  ShortestPathModel reqData = ShortestPathModel(
    sourceName: sourcename.text,
    targetName: targetname.text,
  );

  Dio postService = Dio();

  Response response = await postService.post(
      'https://652e57110b8d8ddac0b13441.mockapi.io/api/v1/users',
      data: reqData.toJson());
  Options(
      // headers: {"7b8b68d8e5cca8fea5120e32": "1"},
      contentType: 'application/json');

  print(response.statusCode.toString());
  print(response);
  x = response.toString();
}
