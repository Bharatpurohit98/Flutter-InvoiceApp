import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    var bytes = await pdf.save();

    var dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    var url = file.path;

    await OpenFile.open(url);
  }
}
