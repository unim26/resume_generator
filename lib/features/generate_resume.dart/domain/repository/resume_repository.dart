import 'package:flutter/services.dart';
abstract class ResumeRepository {
  //for generating resume
  Future<Uint8List> generateResume();
}
