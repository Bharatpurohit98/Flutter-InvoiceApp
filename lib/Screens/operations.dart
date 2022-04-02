import 'add_items.dart';

int calculateSub(int subtotal) {
  if (quantitycontroller.text.isNotEmpty && ratecontroller.text.isNotEmpty) {
    int qty = int.parse(quantitycontroller.text);
    int rate = int.parse(ratecontroller.text);

    int subtotal = "${qty * rate}" as int;
  }
  return subtotal;
}
