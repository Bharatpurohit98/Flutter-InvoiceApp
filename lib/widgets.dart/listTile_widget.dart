// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:invoiceapp/Notifiers/item_notifier.dart';

import 'package:invoiceapp/model/items.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  // final List<Items> items;
  // final Function(Items) onDelete;

  @override
  Widget build(BuildContext context) {
    ItemNotifier itemNotifier = Provider.of<ItemNotifier>(context);
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Product: ${context.watch<ItemNotifier>().itemList[index].productName}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Sale Price: ${context.watch<ItemNotifier>().itemList[index].salePrice}',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () => {context.read<ItemNotifier>().deleteUser(index)},
              )
            ],
          ),
        ),
      ),
      itemCount: context.watch<ItemNotifier>().itemList.length,
    );
  }
}
