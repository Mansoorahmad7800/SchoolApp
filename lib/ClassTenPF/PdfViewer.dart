import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;
  const PDFViewerPage({Key? key, required this.file}) : super(key: key);

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  PDFViewController? controller;
  int pages = 0;
  int indexpage = 0;
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexpage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: pages >= 2
            ? [
                Center(
                  child: Text(text),
                ),
                IconButton(
                  icon: Icon(Icons.chevron_left, size: 32),
                  onPressed: () {
                    final page = indexpage == pages + 1 ? 0 : indexpage - 1;
                    controller!.setPage(page);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right, size: 32),
                  onPressed: () {
                    final page = indexpage == pages - 1 ? 0 : indexpage + 1;
                    controller!.setPage(page);
                  },
                )
              ]
            : null,
      ),
      body: RotatedBox(
        quarterTurns: 3,
        child: PDFView(
            filePath: widget.file.path,
            onRender: (pages) => setState(() => this.pages = pages!),
            onViewCreated: (controller) => this.controller = controller,
            onPageChanged: (indexpage, _) =>
                setState(() => this.indexpage = indexpage!)),
      ),
    );
  }
}
