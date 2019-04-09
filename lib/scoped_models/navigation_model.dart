import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:recappture2/helpers/my_dialogs.dart';
import 'dart:io';
import 'package:recappture2/model/my_data.dart';
import 'package:recappture2/pages/location/location_slide.dart';

class NavigationModel extends Model {
  final PageController navigationCtrl = new PageController(initialPage: 0);

  double get page => navigationCtrl.page;

  bool _greenLight = true;

  bool get greenLight => _greenLight;

  void setGreenLight(bool myBool) {
    _greenLight = myBool;
  }

  String nextText = 'NAPREJ';

  void setNextText(String text) {
    nextText = text;
    notifyListeners();
  }

  void next() {
    if (page.round() == 2) {
      if (LocationSlideState.validateLocation()) {
        navigationCtrl.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
        print('helllo');
      }
    }
    if (page.round() < 5) {
      //_greenLight = false;
      navigationCtrl.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else if (page.round() == 5) {
      navigationCtrl.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      nextText = 'IZHOD';
    } else if (page.round() == 6) {
      MyData.printData();
      exit(0);
    }
    notifyListeners();
  }

  void goBack(BuildContext context) {
    _greenLight = true;
    if (page.round() == 0) {
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return exitDialog(context);
        },
      );
    } else if (page.round() == 6) {
      return;
    } else {
      navigationCtrl.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      nextText = 'NAPREJ';
    }
    notifyListeners();
  }
}