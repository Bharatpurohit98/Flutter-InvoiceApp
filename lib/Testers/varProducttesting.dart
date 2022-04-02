// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoiceapp/Components/globalvariables.dart' as globals;
import 'package:invoiceapp/Notifiers/item_notifier.dart';
import 'package:provider/provider.dart';

class Var extends StatelessWidget {
  const Var({ Key? key }) : super(key: key);

  // Object? get storeNumber => null;

  // get child => null;

  @override
  Widget build(BuildContext context) {
    ItemNotifier itemNotifier = Provider.of<ItemNotifier>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
             child: AlertDialog(
              content: Text(globals.productNNNNN),
            ),
          ),
          // ignore: prefer_const_constructors
          Padding(padding: EdgeInsets.all(20)),
           AlertDialog(
              content: Text(globals.ratePPPP),
            ),
             Padding(padding: EdgeInsets.all(20)),
         
            //  AlertDialog(
            //   content: Text('${context.watch<ItemNotifier>().itemList.productName}'),
            //   )
              

            
        ],
      ),
    );
  }
}