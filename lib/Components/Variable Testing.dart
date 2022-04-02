// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:invoiceapp/Components/globalvariables.dart' as globals;

class Var extends StatelessWidget {
  const Var({ Key? key }) : super(key: key);

  // Object? get storeNumber => null;

  // get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
             child: AlertDialog(
              content: Text(globals.storeNumber),
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
           AlertDialog(
              content: Text(globals.bussNameInput),
            ),
        ],
      ),
    );
  }
}
