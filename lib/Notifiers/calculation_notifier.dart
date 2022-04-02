import 'package:flutter/material.dart';

class CalculationItemAmt extends ChangeNotifier {
  String? _emptyQty = '';
  String? get emptyQty => _emptyQty;

  void setEmptyQty(input) {
    _emptyQty = input;
    notifyListeners();
  }

  String? _emptyRate = '';
  String? get emptyRate => _emptyRate;

  void setEmptyRate(input) {
    _emptyRate = input;
    notifyListeners();
  }

  double? _qty;
  double? _rate;

  double? get qty => _qty;
  double? get rate => _rate;

  void setQty(double inputqty) {
    _qty = inputqty;
    notifyListeners();
  }

  void setRate(double inputrate) {
    _rate = inputrate;
    notifyListeners();
  }

  double? _subtotal = 0;
  double? get subtotal => _subtotal;

  void subTotal() {
    if (_qty != null && _rate != null) {
      _subtotal = _qty! * _rate!;
    }
    notifyListeners();
  }

  String? _emptyDiscount = '';
  String? get emptyDiscount => _emptyDiscount;

  void setEmptyDiscount(input) {
    _emptyDiscount = input;
  }

  double? _discount = 0;
  double? get discount => _discount;

  double? _discountPercent = 0;
  double? get discountPercent => _discountPercent;

  void setDiscountPercent(double input) {
    _discountPercent = input;
    notifyListeners();
  }

  double discountCal() {
    _discount = (subtotal! * discountPercent!) / 100;
    notifyListeners();

    return _discount!;
  }

  double? _net;
  double? get net => _net;

  void setNet() {
    _net = (_subtotal! - _discount!);
    notifyListeners();
  }

  String? _taxSelected = "Tax Included";
  String? get taxSelected => _taxSelected;

  void setTaxSelected(input) {
    _taxSelected = input;
    notifyListeners();
  }

  double? _tax = 0.0;
  double? get tax => _tax;

  String? _taxType = "None";
  String? get taxType => _taxType;

  void setTaxType(input) {
    _taxType = input;
  }

  // double setTaxExcluded() {
  //   if (_taxType == 'GST@3%') {
  //     _tax = (net! * 3) / 100;
  //   }
  //   notifyListeners();

  //   return _tax!;
  // }
  double setTaxIncluded() {
    switch (_taxType) {
      case "None":
        {
          _tax = 0;
        }
        break;

      case "Exempted":
        {
          _tax = 0;
        }
        break;
      case "GST@0%":
        {
          _tax = 0;
        }
        break;
      case "IGST@0%":
        {
          _tax = 0;
        }
        break;

      case "GST@0.25%":
        {
          _tax = (_net! * 0.25) / 100;
        }
        break;

      case "IGST@0.25%":
        {
          _tax = (_net! * 0.25) / 100;
        }
        break;

      case "GST@3%":
        {
          _tax = _net! - (_net! * (100 / (100 + 3)));
        }
        break;

      case "IGST@3%":
        {
          _tax = (_net! * 3) / 100;
        }
        break;
      case "GST@5%":
        {
          _tax = (_net! * 5) / 100;
        }
        break;
      case "IGST@5%":
        {
          _tax = (_net! * 5) / 100;
        }
        break;
      case "GST@12%":
        {
          _tax = (_net! * 12) / 100;
        }
        break;
      case "IGST@12%":
        {
          _tax = (_net! * 12) / 100;
        }
        break;
      case "GST@18%":
        {
          _tax = (_net! * 18) / 100;
        }
        break;
      case "IGST@18%":
        {
          _tax = (_net! * 18) / 100;
        }
        break;
      case "GST@28%":
        {
          _tax = (_net! * 28) / 100;
        }
        break;
      case "IGST@28%":
        {
          _tax = (_net! * 28) / 100;
        }
        break;
      default:
        {
          0;
        }
    }
    notifyListeners();

    return _tax!;
  }

  double setTaxExcluded() {
    switch (_taxType) {
      case "None":
        {
          _tax = 0;
        }
        break;

      case "Exempted":
        {
          _tax = 0;
        }
        break;
      case "GST@0%":
        {
          _tax = 0;
        }
        break;
      case "IGST@0%":
        {
          _tax = 0;
        }
        break;

      case "GST@0.25%":
        {
          _tax = (_net! * 0.25) / 100;
        }
        break;

      case "IGST@0.25%":
        {
          _tax = (_net! * 0.25) / 100;
        }
        break;

      case "GST@3%":
        {
          _tax = (_net! * 3) / 100;
        }
        break;

      case "IGST@3%":
        {
          _tax = (_net! * 3) / 100;
        }
        break;
      case "GST@5%":
        {
          _tax = (_net! * 5) / 100;
        }
        break;
      case "IGST@5%":
        {
          _tax = (_net! * 5) / 100;
        }
        break;
      case "GST@12%":
        {
          _tax = (_net! * 12) / 100;
        }
        break;
      case "IGST@12%":
        {
          _tax = (_net! * 12) / 100;
        }
        break;
      case "GST@18%":
        {
          _tax = (_net! * 18) / 100;
        }
        break;
      case "IGST@18%":
        {
          _tax = (_net! * 18) / 100;
        }
        break;
      case "GST@28%":
        {
          _tax = (_net! * 28) / 100;
        }
        break;
      case "IGST@28%":
        {
          _tax = (_net! * 28) / 100;
        }
        break;
      default:
        {
          0;
        }
    }
    notifyListeners();

    return _tax!;
  }

  double? _totalAmoutAfterTax = 0;
  double? get totalAmountAfterTax => _totalAmoutAfterTax;

  double setTotalAmountAfterTax() {
    _totalAmoutAfterTax = (_subtotal! - _discount! + _tax!);
    notifyListeners();

    return _totalAmoutAfterTax!;
  }
}
