part of 'firestore_bloc.dart';

abstract class FirestoreState extends Equatable {
  const FirestoreState();

  @override
  List<Object> get props => [];
}

class FirestoreInitial extends FirestoreState {}

class FirestoreStartedState extends FirestoreState {}

class FirestoreSuccessState extends FirestoreState {
  final Indicator indicator;

  const FirestoreSuccessState(this.indicator);
}

class FirestoreFailureState extends FirestoreState {
  final String errorMsg;

  const FirestoreFailureState(this.errorMsg);
}
