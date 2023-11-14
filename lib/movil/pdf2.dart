import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

void _showBottomSheet(BuildContext context, String pdfPath) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: PDFScreen(path: pdfPath),
      );
    },
  );
}

class _MyAppState extends State<MyApp> {
  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";
  String assetPDFPath = "";

  @override
  void initState() {
    super.initState();
    requestStoragePermission();

    downloadFile(
            "https://storage.googleapis.com/backsocialmovil.appspot.com/211125-Hern%C3%83%C2%A1ndez%20Guti%C3%83%C2%A9rrez-Presentaciones%20sobre%20APA.pdf?GoogleAccessId=firebase-adminsdk-7apgz%40backsocialmovil.iam.gserviceaccount.com&Expires=16447039200&Signature=Rlp5F6cUpy9KuULcHxld2%2FBZsn4MJmzCd56F5zR0DpyYaashYBfu30dX%2FatPbVUau3U6%2BGRYCluWUrI0U7UwwAX4Ara6xpW2CCRUNyaFymp3lXnxbDU7E7kWj%2FT3PvsURpTOBpwA6S%2FTy7qT5Ck2aE%2FTxUvsoAv%2F%2BSvn7%2BXG%2FrKVSXxPckc1UUUEZ%2Bt85KZaURg8b8nUjrlNpKpaLSmFsGyzPUWkkVDUm8uTpG5olGoq9RwI4asiheX4svFuzAQGlieeSEQuRMzoMbAhF%2BDvXxf6%2FH7O%2FtVq4c3ajV6IltUoXgaXPFPBNFksFgrsdeKArwHVxEHvpY52b1ufdY878g%3D%3D")
        .then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  void requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<File> downloadFile(String url) async {
    Dio dio = Dio();
    try {
      // Usar getApplicationDocumentsDirectory para Android 10 o superior
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/descargado.pdf");
      await dio.download(url, file.path);
      return file;
    } catch (e) {
      throw Exception("Error al descargar el archivo: $e");
    }
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PDF View',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(child: Builder(
          builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text("Open PDF"),
                  onPressed: () {
                    if (remotePDFpath != null) {
                      _showBottomSheet(context, remotePDFpath);
                    }
                  },
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}

class PDFScreen extends StatefulWidget {
  final String? path;

  PDFScreen({Key? key, this.path}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document"),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation:
                false, // if set to true the link is handled in flutter
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )
        ],
      ),
    );
  }
}
