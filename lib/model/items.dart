//import 'package:invoiceapp/Components/globalvariables.dart' as globals;

class Items {
  String? productName;
  String? salePrice;
  // String? hsn;
  // String? purchasePrice;

  Items(this.productName, this.salePrice);

  // this.hsn,
  // this.purchasePrice,
}

class NewItems {
  String? productName;
  double? salePrice;
  double? purchasePrice;
  double? stock;

  NewItems(this.productName, this.salePrice, this.purchasePrice, this.stock);
}
