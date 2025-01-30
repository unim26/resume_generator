import 'dart:typed_data';

import 'package:flutter/material.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              // show options
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body:Expanded(
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
    );
  }
}
