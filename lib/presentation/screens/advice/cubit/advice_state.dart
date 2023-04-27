part of 'advice_cubit.dart';

abstract class AdviceState extends Equatable {
  const AdviceState();

  @override
  List<Object> get props => [];
}

class AdviceInitial extends AdviceState {}

class AdviceLoadingState extends AdviceState {}

class AdviceLoadedState extends AdviceState {
  final String advice;
  const AdviceLoadedState({required this.advice});

  @override
  List<Object> get props => [advice];
}

class AdviceErrorState extends AdviceState {
  final String errorMessage;
  const AdviceErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
