import 'dart:io';  

import 'package:invoiceapp/model/customer.dart';
import 'package:invoiceapp/model/owner.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import '../model/invoice.dart';
import 'package:invoiceapp/api/pdf_api.dart';


class PdfInvoiceApi {

 static Future<File> generate(Invoice invoice) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice), 
        SizedBox(height: 2 * PdfPageFormat.cm),
        buildInvoice(invoice),
        Divider(),
        buildTotal(invoice),
      ],
      footer: (context) => buildFooter(invoice),
    ));
    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }
 

  static Widget buildTItle(Invoice invoice) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Invoice',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: PdfColors.purple200)),
        SizedBox(height: 0.10 * PdfPageFormat.cm),
      ]);

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOwnerInfo(invoice.ownerInfo),
              buildTItle(invoice),
              Container(
                height: 50,
                width: 50,
                child: BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: invoice.info.invoiceNo,
                ),
              ),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerInfo(invoice.customer),
              buildInvoiceInfo(invoice.info),
            ],
          ),
        ],
      );

  static buildOwnerInfo(Owner ownerInfo) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(ownerInfo.owner, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Text(ownerInfo.contact)
      ]);

  static buildCustomerInfo(Customer customer) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(customer.name, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Text(customer.contact),
      ]);

  static buildInvoiceInfo(InvoiceInfo info) {
    const paymentTerms = 'Terms';
    const dueDate = '7 days';
    final titles = <String>[
      'Invoice Number:',
      'Invoice Date:',
      'Payment Terms:',
      'State of Supply:',
      'Due Date:',
    ];

    var data = <String>[
      info.invoiceNo,
      info.date,
      paymentTerms,
      info.selectedState,
      dueDate,
    ];
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(titles.length, (index) {
          final title = titles[index];
          var value = data[index];

          return buildText(title: title, value: value, width: 200);
        }));
  }

  static buildInvoice(Invoice invoice) {
    final headers = [
      'Description',
      'Date',
      'HSN/Sac',
      'Quantity',
      'Unit Price',
      'GST',
      'Total'
    ];

    var data = invoice.items.map((item) {
      return [
        item.description,
        item.date,
        item.hsn,
        item.qty,
        item.unit,
        item.tax,
        item.total,
      ];
    }).toList();

    return Table.fromTextArray(
        headers: headers,
        data: data,
        border: null,
        headerStyle: TextStyle(fontWeight: FontWeight.bold),
        headerDecoration: const BoxDecoration(color: PdfColors.purple200),
        cellHeight: 30,
        cellAlignments: {
          0: Alignment.centerLeft,
          1: Alignment.centerRight,
          2: Alignment.centerRight,
          3: Alignment.centerRight,
          4: Alignment.centerRight,
          5: Alignment.centerRight,
          6: Alignment.centerRight,
        });
  }

  static buildTotal(Invoice invoice) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(children: [
        Spacer(flex: 6),
        Expanded(
            flex: 4,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildText(
                title: 'Net Total',
                value: 'Value',
                unite: true,
              ),
              Divider(),
              buildText(
                title: 'Total Amount',
                titleStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                value: 'Total value',
                unite: true,
              ),
              SizedBox(height: 2 * PdfPageFormat.mm),
              Container(height: 1, color: PdfColors.grey400),
              SizedBox(height: 0.5 * PdfPageFormat.mm),
              Container(height: 1, color: PdfColors.grey400),
            ]))
      ]),
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }

  static buildFooter(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(title: 'Address', value: 'Sample Address'),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(title: 'Upi', value: 'Sample Upi id'),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(title: 'Gst', value: 'Sample Gst No. e.g. 27AQXPP44569R')
      ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }
  
}
