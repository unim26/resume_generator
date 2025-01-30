import 'dart:typed_data';

import 'package:resumegenerator/core/usecase/usecase.dart';
import 'package:resumegenerator/features/generate_resume.dart/domain/repository/resume_repository.dart';

class GenerateResumeUsecase implements UseCase<Uint8List, void> {
  final ResumeRepository _resumeRepository;

  GenerateResumeUsecase(this._resumeRepository);

  @override
  Future<Uint8List> call(void params) {
    return _resumeRepository.generateResume();
  }
}
