// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoiceapp/Screens/home_screen.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen())),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text('About Us', style: TextStyle(color: Colors.black.withOpacity(0.8)),),
        backgroundColor: Colors.white,
      ),
      body: Container(padding: EdgeInsets.all(15),
        child: Text('E - Billing Invoice App is a app to generate sale invoices, manage sales and purchases for a business', style: TextStyle(fontSize: 18, color: Colors.blue),)),
    );
  }
}