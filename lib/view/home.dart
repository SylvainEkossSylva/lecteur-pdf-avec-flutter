

import 'package:flutter/material.dart';
import 'package:lecteurpdf/main.dart';
import 'package:lecteurpdf/view/home.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.da;

class home extends StatefulWidget {
  final String pdfUrl;

  home({required this.pdfUrl});

  @override
  _PDFViewerState createState() {
    return _PDFViewerState();
  }
}

class _PDFViewerState extends State<home> {
  final _pdfViewerController = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        actions: [
          ShareWidget(pdfUrl: widget.pdfUrl),
          DownloadWidget(pdfUrl: widget.pdfUrl),
          EditWidget(pdfUrl: widget.pdfUrl),
        ],
      ),
      body: SfPdfViewer.network(
        widget.pdfUrl,
        controller: _pdfViewerController,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _pdfViewerController.previousPage(),
            child: Icon(Icons.arrow_back),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => _pdfViewerController.nextPage(),
            child: Icon(Icons.arrow_forward),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => _pdfViewerController.zoomLevel += 0.5,
            child: Icon(Icons.zoom_in),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => _pdfViewerController.zoomLevel -= 0.5,
            child: Icon(Icons.zoom_out),
          ),
        ],
      ),
    );
  }
}

class PdfViewerController {
  late double zoomLevel;

  nextPage() {}

  previousPage() {}
}

class SfPdfViewer {
  static network(String pdfUrl, {required PdfViewerController controller}) {}
}

class ShareWidget extends StatelessWidget {
  final String pdfUrl;

  ShareWidget({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.share),
      onPressed: () {
        Share.share(pdfUrl);
      },
    );
  }
}

class Share {
  static void share(String pdfUrl) {}
}

class DownloadWidget extends StatelessWidget {
  final String pdfUrl;

  DownloadWidget({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.download),
      onPressed: () {
        launch(pdfUrl);
      },
    );
  }

  void launch(String pdfUrl) {}
}

class EditWidget extends StatelessWidget {
  final String pdfUrl;

  EditWidget({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        // Ouvrir le PDF dans une application d'édition
        launch(pdfUrl);
      },
    );
  }

  void launch(String pdfUrl) {}
}