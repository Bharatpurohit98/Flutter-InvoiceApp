// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BilledItems extends StatelessWidget {
  const BilledItems({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text('Total Billed Items', style: TextStyle(color: Colors.black.withOpacity(0.8)),),
        backgroundColor: Colors.white,
      ),
      body: ListView(

      ),
    );
  }
}