import 'package:flutter/material.dart';
import 'package:recappture2/helpers/components.dart';
import 'package:recappture2/helpers/my_colors.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:recappture2/scoped_models/wood_model.dart';

class WoodSlide extends StatefulWidget {
  @override
  _WoodSlideState createState() => _WoodSlideState();
}

class _WoodSlideState extends State<WoodSlide> with AutomaticKeepAliveClientMixin<WoodSlide> {

  final WoodModel woodModel = new WoodModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<WoodModel>(
      model: woodModel,
      child: Container(
        padding: EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MyImage(
              height: 60,
              asset: 'assets/wood.png',
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: MyText(
                text: 'Izberite vrsto lesa',
                size: 25,
                color: MyColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 4),
              child: MyText(
                text: 'Kateri sliki je les bolj podoben?',
                size: 18,
                color: MyColors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () => woodModel.addDeciduous(context),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: <Widget>[
                          ScopedModelDescendant<WoodModel>(
                            builder: (context, child, model) {
                              String deciduous;
                              if (model.turn == 0) {
                                deciduous = 'assets/listavec1.png';
                              } else if (model.turn == 1) {
                                deciduous = 'assets/listavec2.png';
                              } else {
                                deciduous = 'assets/listavec3.png';
                              }
                              return Image.asset(deciduous, fit: BoxFit.contain,);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: MyText(
                              text: 'Listavec',
                              size: 16,
                              color: MyColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => woodModel.addConiferous(context),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: <Widget>[
                          ScopedModelDescendant<WoodModel>(
                            builder: (context, child, model) {
                              String coniferous;
                              if (model.turn == 0) {
                                coniferous = 'assets/iglavec1.png';
                              } else if (model.turn == 1) {
                                coniferous = 'assets/iglavec2.png';
                              } else {
                                coniferous = 'assets/iglavec3.png';
                              }
                              return Image.asset(coniferous, fit: BoxFit.contain,);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: MyText(
                              text: 'Iglavec',
                              size: 16,
                              color: MyColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
