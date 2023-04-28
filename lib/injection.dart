import 'package:advice/data/datasource/advice_remote_datasource.dart';
import 'package:advice/data/repositories/advice_repo_impl.dart';
import 'package:advice/domain/repositories/advice_repo.dart';
import 'package:advice/domain/usecases/advice_usecase.dart';
import 'package:advice/presentation/screens/advice/cubit/advice_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I;

Future<void> init() async {
  sl.registerFactory(() => AdviceCubit(adviceUsecase: sl()));

  sl.registerFactory(() => AdviceUsecase(adviceRepo: sl()));

  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));

  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDataSourceImpl(client: sl()));

  sl.registerFactory(() => http.Client());
}
