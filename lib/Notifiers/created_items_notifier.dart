// ignore_for_file: prefer_final_fields

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:invoiceapp/model/items.dart';

class CreatedItems extends ChangeNotifier {
  String? _productName;
  String? get productName => _productName;

  void setProductName(input) {
    _productName = input;
    notifyListeners();
  }

  double? _salePrice = 0;
  double? get salePrice => _salePrice;

  void setSalePrice(input) {
    _salePrice = input;
    notifyListeners();
  }

  double? _purchasePrice = 0;
  double? get purchasePrice => _purchasePrice;

  void setPurchasePrice(input) {
    _purchasePrice = input;
    notifyListeners();
  }
 
  double? _stock = 0;
  double? get stock => _stock;

  void setStock(input) {
    _stock = input;
    notifyListeners();
  }

  

  List<NewItems> _newItemsList = [];

  UnmodifiableListView<NewItems> get newItemsList =>
      UnmodifiableListView(_newItemsList);

  addItem(NewItems newItem) {
    _newItemsList.add(newItem);
    notifyListeners();
  }

  deleteitem(index) {
    _newItemsList.removeWhere((_newitems) =>
        _newitems.productName == newItemsList[index].productName);
    notifyListeners();
  }
}
