// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:invoiceapp/model/items.dart';
import 'package:invoiceapp/widgets.dart/ListTile_widget.dart';


class Stock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.8),
            )),
        backgroundColor: Colors.white,
        title: Text('Stock',style:  TextStyle(color: Colors.black),),
      ),
      body: Padding(padding: EdgeInsets.all(8),
      child: ItemList(),),
    );
  }
}