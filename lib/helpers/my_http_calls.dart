import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:recappture2/model/my_data.dart';
import 'package:dio/dio.dart';

const String api = 'http://88.200.63.178:3000';

Future sendUser() async {
  var url = '$api/user';

  Map data = {
    'email': MyData.email,
    'phone_number': MyData.phone,
    'admin': '0'
  };

  var body = json.encode(data);

  var myResponse = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body
  );

  var myData = jsonDecode(myResponse.body);
  MyData.userId = myData['message']['insertId'];
  await sendOrder();
}


Future sendOrder() async {
  String url = '$api/order/';
  Map myBody = {
    'user_id': MyData.userId,
    'address': MyData.location,
    'lat': MyData.lat,
    'lng': MyData.lng,
    'kub': MyData.quantity,
    'wood_type': MyData.woodType,
  };
  var myResponse = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(myBody));
  var myData = jsonDecode(myResponse.body);
  MyData.orderId = myData['message']['insertId'];
  await sendQuiz();
}

Future sendQuiz() async {
  String url = '$api/quiz/';
  Map myBody = {
    'order_id': MyData.orderId,
    'q1': MyData.quiz1,
    'q2': MyData.quiz2,
    'q3': MyData.quiz3,
  };
  await http.post(url, headers: {'Content-Type': 'application/json'}, body: json.encode(myBody) );
  await sendImage();
}




Future sendImage() async {
  String url = '$api/image/';
  int orderId = MyData.orderId;

  if (MyData.photoList[0] != '') {
    String base64Image = base64Encode(File(MyData.photoList[0]).readAsBytesSync());
    String photo = 'data:image/jpeg;base64,' + base64Image;

    FormData formData = new FormData.from({
      "order_id": orderId.toString(),
      "order_img_base64": photo,
    });
    var res = await Dio().post(url, data: formData);

    print(res.statusCode);
    print(res);

  }
  if (MyData.photoList[1] != '') {
    String base64Image = base64Encode(File(MyData.photoList[1]).readAsBytesSync());
    String photo = 'data:image/jpeg;base64,' + base64Image;
    Map myBody = {'order_id': orderId, 'order_img_base64': photo};
    await http.post(url, headers: {'Content-Type': 'application/json'}, body: json.encode(myBody));
  }
  if (MyData.photoList[2] != '') {
    String base64Image = base64Encode(File(MyData.photoList[2]).readAsBytesSync());
    String photo = 'data:image/jpeg;base64,' + base64Image;
    Map myBody = {'order_id': orderId, 'order_img_base64': photo};
    await http.post(url, headers: {'Content-Type': 'application/json'}, body: json.encode(myBody));
  }
}

