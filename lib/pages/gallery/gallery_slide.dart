import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:recappture2/scoped_models/gallery_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recappture2/helpers/my_speed_dial.dart';
import 'dart:io';

class GallerySlide extends StatefulWidget {
  @override
  GallerySlideState createState() => GallerySlideState();
}

class GallerySlideState extends State<GallerySlide>
    with AutomaticKeepAliveClientMixin<GallerySlide> {
  static final GalleryModel galleryModel = new GalleryModel();

  Future getImage(ImageSource source, BuildContext context) async {
    if (!galleryModel.checkIfGalleryFull()) {
      File imgFile = await ImagePicker.pickImage(source: source);
      galleryModel.addImage(imgFile.path);
    } else {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Maksimalno število slik doseženo (3/3)!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<GalleryModel>(
      model: galleryModel,
      child: Stack(
        children: <Widget>[
          Container(
            child: Center(
              child: PageView.builder(
                controller: galleryModel.galleryCtrl,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ScopedModelDescendant<GalleryModel>(
                    builder: (context, child, model) {
                      return model.imgList[index] == ''
                          ? child
                          : Container(
                              margin: EdgeInsets.only(top: 200, bottom: 200),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: FileImage(
                                    File(model.imgList[index]),
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Container(
                                    height: 50,
                                    child: GestureDetector(
                                        onTap: () =>
                                            galleryModel.removeImage(index),
                                        child: Image.asset(
                                            'assets/delete_green.png',
                                            fit: BoxFit.contain))),
                              ),
                            );
                      //return child;
                    },
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/photo${index + 1}.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            child: MySpeedDial(),
            bottom: 100.0,
            right: 50.0,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
