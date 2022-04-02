// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Bottomcontainer extends StatelessWidget {

  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        color: Colors.black,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 250,
        width: 400,
      ),
    );
  }
}
