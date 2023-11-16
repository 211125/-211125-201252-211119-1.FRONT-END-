import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';


class PDFViewerScreen extends StatefulWidget {
  final List<String> pdfUrls;

  PDFViewerScreen({Key? key, required this.pdfUrls}) : super(key: key);

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  String remotePDFpath = "";
  int currentPdfIndex = 0;

  @override
  void initState() {
    super.initState();
    requestStoragePermission();
    loadPdf(widget.pdfUrls[currentPdfIndex]);
  }

  void loadPdf(String url) {
    downloadFile(url).then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<File> downloadFile(String url) async {
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/${Uri.parse(url).pathSegments.last}");
      await dio.download(url, file.path);
      return file;
    } catch (e) {
      throw Exception("Error downloading file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PDF Viewer')),
      body: remotePDFpath.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: remotePDFpath,
              swipeHorizontal: true,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Cambia al siguiente PDF
          currentPdfIndex = (currentPdfIndex + 1) % widget.pdfUrls.length;
          loadPdf(widget.pdfUrls[currentPdfIndex]);
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
