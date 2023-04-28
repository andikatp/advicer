import 'package:advice/domain/failures/failure.dart';
import 'package:advice/domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

import '../entities/advice_entity.dart';

class AdviceUsecase {
  final AdviceRepo adviceRepo;
  AdviceUsecase({required this.adviceRepo});

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();
  }
}
