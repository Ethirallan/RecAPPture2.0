import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  MyBackButton({this.fun});
  final VoidCallback fun;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: 40,
        color: Colors.grey,
      ),
      onPressed: fun,
    );
  }
}