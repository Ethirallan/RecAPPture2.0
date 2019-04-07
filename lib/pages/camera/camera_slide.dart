import 'package:flutter/material.dart';
import 'package:recappture2/helpers/components.dart';
import 'package:recappture2/helpers/my_colors.dart';

class CameraSlide extends StatefulWidget {
  @override
  _CameraSlideState createState() => _CameraSlideState();
}

class _CameraSlideState extends State<CameraSlide> with AutomaticKeepAliveClientMixin<CameraSlide> {
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
              fun: null,
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
              fun: null,
            ),
          ),
        ],
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
