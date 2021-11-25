import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/indicator.dart';
import '../../repository/firestore_repository.dart';

part 'firestore_event.dart';
part 'firestore_state.dart';

class FirestoreBloc extends Bloc<FirestoreEvent, FirestoreState> {
  final FirestoreRepository _firestoreRepository = FirestoreRepository();
  void _mapFirestoreAddIndicatorDataEventToState(
      FirestoreAddIndicatorDataEvent event, Emitter<FirestoreState> emit) {
    try {
      emit(FirestoreStartedState());
      _firestoreRepository.submitIndicatorData(event.indicator);
      emit(FirestoreSuccessState());
    } catch (e) {
      emit(FirestoreFailureState(e.toString()));
    }
  }

  FirestoreBloc() : super(FirestoreInitial()) {
    on<FirestoreAddIndicatorDataEvent>(
        _mapFirestoreAddIndicatorDataEventToState);
  }
}
