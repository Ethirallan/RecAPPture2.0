import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  MyText({this.text, this.size, this.fontWeight, this.color});
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
      ),
    );
  }
}

class MyImgBtn extends StatelessWidget {
  MyImgBtn({this.height, this.asset, this.fun});
  final double height;
  final String asset;
  final VoidCallback fun;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        height: height,
        child: Image.asset(
          asset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  MyImage({this.height, this.asset});
  final double height;
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Image.asset(
        asset,
        fit: BoxFit.contain,
      ),
    );
  }
}

class MyInput extends StatelessWidget {
  MyInput({this.hint, this.type, this.onSave, this.validator, this.maxLength, this.ctrl, this.onEditingComplete});
  final String hint;
  final TextInputType type;
  final Function onSave;
  final Function validator;
  final int maxLength;
  final TextEditingController ctrl;
  final Function onEditingComplete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width * 3/5,
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        onSaved: onSave,
        controller: ctrl,
        validator: validator,
        maxLength: maxLength,
        onEditingComplete: onEditingComplete,
        keyboardType: type,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 22.0,
            color: Colors.black
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 20.0
            ),
            hintText: this.hint
        ),
      ),
    );
  }
}

class MyInputWithLabel extends StatelessWidget {
  MyInputWithLabel({this.label, this.type, this.onSave, this.validator, this.onEditingComplete, this.autoVal});
  final String label;
  final TextInputType type;
  final Function onSave;
  final Function validator;
  final Function onEditingComplete;
  final bool autoVal;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 3/5,
      child: TextFormField(
        onSaved: onSave,
        validator: validator,
        keyboardType: type,
        textAlign: TextAlign.center,
        autovalidate: autoVal,
        onEditingComplete: onEditingComplete,
        style: TextStyle(
            fontSize: 22.0,
            color: Colors.black
        ),
        decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.green,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
            labelText: this.label
        ),
      ),
    );
  }
}