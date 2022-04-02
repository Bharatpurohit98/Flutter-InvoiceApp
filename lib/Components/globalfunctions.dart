// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/Login/login.dart';

import 'globalvariables.dart' as globals;

class GlobalFunctions {
  void storedata(context) {
    // ignore: non_constant_identifier_names
    String contact_Number = globals.storeNumber;
    // ignore: non_constant_identifier_names
    String business_Name = globals.bussNameInput;
    Map<String, String> contacts = {
      'number': contact_Number,
      'business_Name': business_Name
    };
    try {
      globals.ref!.push().set(contacts).then((value) =>
          ScaffoldMessenger.of(context)
              // ignore: prefer_const_constructors
              .showSnackBar(SnackBar(content: Text('Datastored'))));
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  void inputverifier(context) {
    if (contact == " ") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Please enter your phone Number",
        style: TextStyle(
            color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),
      )));
    } else if (contact.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Please enter a valid phone number",
        style: TextStyle(
            color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),
      )));
    }
  }


  }

