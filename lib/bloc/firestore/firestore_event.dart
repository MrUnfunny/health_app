part of 'firestore_bloc.dart';

abstract class FirestoreEvent extends Equatable {
  const FirestoreEvent();

  @override
  List<Object> get props => [];
}

class FirestoreAddIndicatorDataEvent extends FirestoreEvent {
  final Indicator indicator;

  const FirestoreAddIndicatorDataEvent(this.indicator);
}
