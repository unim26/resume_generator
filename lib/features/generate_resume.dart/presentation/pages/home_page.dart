import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:printing/printing.dart';
import 'package:resumegenerator/features/generate_resume.dart/data/repository/resume_repository_impl.dart';
import 'package:resumegenerator/features/generate_resume.dart/domain/usecase/generate_resume_usecase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resume Generator"),
      ),
      body: Column(
        children: [
          // Customization Controls
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Font Size"),
                Slider(
                  min: 10,
                  max: 24,
                  value: 20,
                  onChanged: (value) {
                    // ref.read(fontSizeProvider.notifier).state = value;
                    // updatePdf();
                  },
                ),
                Text("Font Color"),
                ColorPicker(
                  pickerColor: Colors.blue.shade400,
                  onColorChanged: (color) {
                    // ref.read(fontColorProvider.notifier).state = color;
                    // updatePdf();
                  },
                ),
                Text("Background Color"),
                ColorPicker(
                  pickerColor: Colors.green.shade400,
                  onColorChanged: (color) {
                    // ref.read(bgColorProvider.notifier).state = color;
                    // updatePdf();
                  },
                ),
              ],
            ),
          ),
          // PDF Preview
          Expanded(
            child: FutureBuilder<Uint8List>(
              future: GenerateResumeUsecase(ResumeRepositoryImpl()).call(null),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text("Error generating PDF ${snapshot.error}"));
                }
                return PdfPreview(
                  canChangePageFormat: false,
                  canChangeOrientation: false,
                  canDebug: false,
                  build: (format) => snapshot.data!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
