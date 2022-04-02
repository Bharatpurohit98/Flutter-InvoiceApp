// ignore_for_file: prefer_final_fields

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:invoiceapp/model/items.dart';

class ItemNotifier extends ChangeNotifier {
  List<Items> _itemsList = [];

  String? _bNameInput;
  String? get bNameInput => _bNameInput;

  UnmodifiableListView<Items> get itemList => UnmodifiableListView(_itemsList);

  addItem(Items items) {
    _itemsList.add(items);
    notifyListeners();
  }

  deleteUser(index) {
    _itemsList.removeWhere(
        (_items) => _items.productName == itemList[index].productName);
    notifyListeners();
  }
}

printB(bNameInput) {

}
