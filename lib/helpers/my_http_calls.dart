import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:recappture2/model/my_data.dart';

const String api = 'http://88.200.63.178:3000';

Future sendUser() async {
  //MyData.printData();
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
    'lat': MyData.lat != null ? MyData.lat : 0,
    'lng': MyData.lng != null ? MyData.lng : 0,
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
  String orderId = MyData.orderId.toString();

  if (MyData.photoList[0] != '') {
    String base64Image = base64Encode(File(MyData.photoList[0]).readAsBytesSync());
    String photo = 'data:image/jpeg;base64,' + base64Image;

    await http.post(url, body: {
      'order_id': orderId,
      'order_img_base64': photo
    }).then((res) {
      print(res.statusCode);
    }).catchError((err) {
      print(err);
    });
  }
  if (MyData.photoList[1] != '') {
    String base64Image = base64Encode(File(MyData.photoList[1]).readAsBytesSync());
    String photo = 'data:image/jpeg;base64,' + base64Image;
    await http.post(url, body: {
      'order_id': orderId,
      'order_img_base64': photo
    }).then((res) {
      print(res.statusCode);
    }).catchError((err) {
      print(err);
    });
  }
  if (MyData.photoList[2] != '') {
    String base64Image = base64Encode(File(MyData.photoList[2]).readAsBytesSync());
    String photo = 'data:image/jpeg;base64,' + base64Image;
    await http.post(url, body: {
      'order_id': orderId,
      'order_img_base64': photo
    }).then((res) {
      print(res.statusCode);
    }).catchError((err) {
      print(err);
    });
  }
}

