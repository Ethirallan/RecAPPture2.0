import 'package:flutter/material.dart';

class NextBtn extends StatelessWidget {
  NextBtn({this.fun, this.text});
  final VoidCallback fun;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: RaisedButton(
          color: Colors.lightGreenAccent,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          onPressed: fun,
        ),
      ),
    );
  }
}