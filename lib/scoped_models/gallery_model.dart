import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class GalleryModel extends Model {
  PageController galleryCtrl = new PageController();

  List<File> _imgList = [];

  int get noOfImg => _imgList.length;

  List<File> get imgList => _imgList;

  void addImage(File file, BuildContext context) {
    if (_imgList.length <= 3) {
      _imgList.add(file);
      notifyListeners();
    }
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Maksimalno število slik doseženo (3/3)!')));
  }

  void removeImage(int index) {
    _imgList.removeAt(index);
    notifyListeners();
  }
}