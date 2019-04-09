import 'package:flutter/material.dart';
import 'package:recappture2/helpers/components.dart';
import 'package:recappture2/helpers/my_colors.dart';
import 'package:recappture2/pages/gallery/gallery_slide.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:recappture2/pages/home/home.dart';

class CameraSlide extends StatefulWidget {
  @override
  _CameraSlideState createState() => _CameraSlideState();
}

class _CameraSlideState extends State<CameraSlide> with AutomaticKeepAliveClientMixin<CameraSlide> {

  Future getImage(ImageSource source) async {
    if (!GallerySlideState.galleryModel.checkIfGalleryFull()) {
      File imgFile = await ImagePicker.pickImage(source: source);
      GallerySlideState.galleryModel.addImage(imgFile.path);
      if (!GallerySlideState.galleryModel.checkIfGalleryEmpty()) {
        HomeState.navigationModel.next();
      }
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Maksimalno število slik doseženo (3/3)!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MyText(
            text: 'Naloži sliko',
            size: 25,
            color: MyColors.grey,
            fontWeight: FontWeight.bold,
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 40),
            child: MyImgBtn(
              height: 120,
              asset: 'assets/add_picture.png',
              fun: () => getImage(ImageSource.gallery),
            ),
          ),
          MyText(
            text: 'ali',
            size: 22,
            color: MyColors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: MyImgBtn(
              height: 50,
              asset: 'assets/camera.png',
              fun: () => getImage(ImageSource.camera),
            ),
          ),
        ],
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
