import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:recappture2/helpers/my_dialogs.dart';
import 'dart:io';
import 'package:recappture2/model/my_data.dart';
import 'package:recappture2/pages/location/location_slide.dart';
import 'package:recappture2/pages/contacts/contacts_slide.dart';
import 'package:recappture2/pages/quantity/quantity_slide.dart';

class NavigationModel extends Model {

  final PageController navigationCtrl = new PageController(initialPage: 0);

  int get page => navigationCtrl.page.round();

  bool _hasPhoto = false;
  bool get hasPhoto => _hasPhoto;

  void setHasPhoto(bool myBool) {
    _hasPhoto = myBool;
    notifyListeners();
  }

  String nextText = 'NAPREJ';

  void setNextText(String text) {
    nextText = text;
    notifyListeners();
  }

  void next() {
    if (page == 4) {
      navigationCtrl.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else if (page == 0 || page == 1) {
      if (hasPhoto) {
        navigationCtrl.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      }
    } else if (page == 2) {
      if (LocationSlideState.validateLocation()) {
        navigationCtrl.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      }
    } else if (page == 3) {
      if (QuantitySlideState.validateQuantity()) {
        navigationCtrl.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      }
    } else if (page == 5) {
      if (ContactSlideState.validateContacts()) {
        MyData.printData();
        navigationCtrl.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
        nextText = 'IZHOD';
      }
    } else if (page == 6) {
      exit(0);
    }
    notifyListeners();
  }

  void goBack(BuildContext context) {
    if (page == 0) {
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return exitDialog(context);
        },
      );
    } else if (page == 6) {
      return;
    } else {
      navigationCtrl.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      nextText = 'NAPREJ';
    }
    notifyListeners();
  }
}