import 'package:advice/domain/failures/failure.dart';
import 'package:advice/domain/usecases/advice_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_state.dart';

const String _serverErrorMessage =
    'Something wrong with the API! please try again later!';
const String _cacheErrorMessage =
    'Something wrong with the API! please try again later!';
const String _generalErrorMessage = 'Please check your connection!';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit() : super(AdviceInitial());

  final AdviceUsecase adviceUsecase = AdviceUsecase();
  void advicerRequestEvent() async {
    emit(AdviceLoadingState());
    final result = await adviceUsecase.getAdvice();
    result.fold(
      (failure) => emit(AdviceErrorState(errorMessage: _errorMessage(failure))),
      (advice) => emit(AdviceLoadedState(advice: advice.advice)),
    );
  }

  String _errorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return _serverErrorMessage;
      case CacheFailure:
        return _cacheErrorMessage;
      default:
        return _generalErrorMessage;
    }
  }
}
