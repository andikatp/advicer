import 'package:advice/domain/entities/advice_entity.dart';
import 'package:advice/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource();
}
