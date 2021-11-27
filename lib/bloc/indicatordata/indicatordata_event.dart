part of 'indicatordata_bloc.dart';

abstract class IndicatordataEvent extends Equatable {
  const IndicatordataEvent();

  @override
  List<Object> get props => [];
}

class IndicatordataGetDataEvent extends IndicatordataEvent {
  final Indicator indicator;

  const IndicatordataGetDataEvent(this.indicator);
}
