import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ApiServiceProvider {

  static String BASE_URL ='https://www.mapsofworld.com/world-map.pdf';
  static Future<String> loadPDF(String pPath) async {
    BASE_URL= pPath;
    var response = await http.get(Uri.parse(pPath));

    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/data.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }
}
