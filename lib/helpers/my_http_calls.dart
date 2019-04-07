import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:recappture2/model/my_data.dart';

Future sendUser() async {
  String url = 'http://88.200.63.178:3000/user/';
  var myResponse;
  Map myBody = {
    'email': MyData.email,
    'phone_number': MyData.phone,
    'admin': 0,
  };
  myResponse = await http.post(url, body: json.encode(myBody), headers: {'Content-Type': 'application/json; charset=utf-8'});
  var myData = jsonDecode(myResponse.body);
  MyData.userId = myData['message']['insertId'];
  await sendOrder();
}

Future sendOrder() async {
  String url = 'http://88.200.63.178:3000/order/';
  var myResponse;
  Map myBody = {
    'user_id': MyData.userId,
    'address': MyData.location,
    'lat': MyData.lat,
    'lng': MyData.lng,
    'kub': MyData.quantity,
    'wood_type': MyData.woodType,
  };
  myResponse = await http.post(url, body: json.encode(myBody), headers: {'Content-Type': 'application/json; charset=utf-8'});
  var myData = jsonDecode(myResponse.body);
  MyData.orderId = myData['message']['insertId'];
  await sendQuiz();
}

Future sendQuiz() async {
  String url = 'http://88.200.63.178:3000/quiz/';
  Map myBody = {
    'order_id': MyData.orderId,
    'q1': MyData.quiz1,
    'q2': MyData.quiz2,
    'q3': MyData.quiz3,
  };
  await http.post(url, body: json.encode(myBody), headers: {'Content-Type': 'application/json; charset=utf-8'});
  await sendImage();
}

Future sendImage() async {
  String url = 'http://88.200.63.178:3000/image/';
  int orderId = MyData.orderId;
  if (MyData.photoList[0] != '') {
    List<int> imageBytes = File(MyData.photoList[0]).readAsBytesSync();
    String photo = 'data:image/jpeg;base64,' + base64UrlEncode(imageBytes);
    Map myBody = {'order_id': orderId, 'order_img_base64': photo};
    await http.post(url, body: json.encode(myBody), headers: {'Content-Type': 'application/json; charset=utf-8'});
  }
  if (MyData.photoList[1] != '') {
    List<int> imageBytes = File(MyData.photoList[1]).readAsBytesSync();
    String photo = 'data:image/jpeg;base65,' + base64UrlEncode(imageBytes);
    Map myBody = {'order_id': orderId, 'order_img_base64': photo};
    await http.post(url, body: json.encode(myBody), headers: {'Content-Type': 'application/json; charset=utf-8'});
  }
  if (MyData.photoList[1] != '') {
    List<int> imageBytes = File(MyData.photoList[1]).readAsBytesSync();
    String photo = 'data:image/jpeg;base64,' + base64UrlEncode(imageBytes);
    Map myBody = {'order_id': orderId, 'order_img_base64': photo};
    await http.post(url, body: json.encode(myBody), headers: {'Content-Type': 'application/json; charset=utf-8'});
  }
}

