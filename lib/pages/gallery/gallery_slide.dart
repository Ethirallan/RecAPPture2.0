import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:recappture2/scoped_models/gallery_model.dart';

class GallerySlide extends StatefulWidget {
  @override
  _GallerySlideState createState() => _GallerySlideState();
}

class _GallerySlideState extends State<GallerySlide>
    with AutomaticKeepAliveClientMixin<GallerySlide> {
  final GalleryModel galleryModel = new GalleryModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<GalleryModel>(
      model: galleryModel,
      child: Container(
        padding: EdgeInsets.only(left: 50, right: 50),
        child: Center(
          child: PageView.builder(
            controller: galleryModel.galleryCtrl,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return ScopedModelDescendant<GalleryModel>(
                builder: (context, child, model) {
                  return model.imgList.isEmpty ? child : Container();
                  //return child;
                },
                child: Image.asset('assets/photo${index + 1}.png'),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
