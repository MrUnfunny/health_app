part of 'indicatordata_bloc.dart';

abstract class IndicatordataState extends Equatable {
  const IndicatordataState();

  @override
  List<Object> get props => [];
}

class IndicatordataInitial extends IndicatordataState {}

class IndicatordataStartState extends IndicatordataState {}

class IndicatordataSuccessState extends IndicatordataState {
  final Map<DateTime, double> data;

  const IndicatordataSuccessState(this.data);
}

class IndicatordataFailureState extends IndicatordataState {
  final String errorMsg;

  const IndicatordataFailureState(this.errorMsg);
}
