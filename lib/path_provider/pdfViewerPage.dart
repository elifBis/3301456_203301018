import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'ApiServiceProvider.dart';

class PdfViewerPage extends StatefulWidget {
  final String pdfYol;
  const PdfViewerPage ({required this.pdfYol});
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? localPath; //late String localPath

  @override
  void initState() {
    super.initState();

    ApiServiceProvider.loadPDF(widget.pdfYol).then((value) { //ApiServiceProvider
      setState(() {
        localPath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[700],
        title: Text("",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: localPath != null
          ? PDFView(
        filePath: localPath,
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
