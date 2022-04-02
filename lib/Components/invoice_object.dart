import 'package:invoiceapp/model/customer.dart';
import 'package:invoiceapp/model/invoice.dart';
import 'package:invoiceapp/model/owner.dart';
//import '../model/items.dart';

var invoice = Invoice(
  customer: Customer(),
  info: InvoiceInfo(),
  items: [InvoiceItems()],
  ownerInfo: Owner(),
);
