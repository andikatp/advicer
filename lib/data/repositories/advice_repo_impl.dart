import 'package:advice/data/datasource/advice_remote_datasource.dart';
import 'package:advice/data/exceptions/exceptions.dart';
import 'package:advice/domain/failures/failure.dart';
import 'package:advice/domain/entities/advice_entity.dart';
import 'package:advice/domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {
  AdviceRemoteDatasource adviceRemoteDatasource = AdviceRemoteDataSourceImpl();

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    try {
      final result =
          await adviceRemoteDatasource.getAdviceFromRemoteDatasource();
      return right(result);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
