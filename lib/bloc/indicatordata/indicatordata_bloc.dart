import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/indicator.dart';
import '../../repository/firestore_repository.dart';

part 'indicatordata_event.dart';
part 'indicatordata_state.dart';

class IndicatordataBloc extends Bloc<IndicatordataEvent, IndicatordataState> {
  final FirestoreRepository _firestoreRepository = FirestoreRepository();
  Future<void> _mapIndicatordataEventToState(
      IndicatordataGetDataEvent event, Emitter<IndicatordataState> emit) async {
    try {
      emit(IndicatordataStartState());
      final data = await _firestoreRepository.getIndicatorData(event.indicator);
      emit(IndicatordataSuccessState(data));
    } catch (e) {
      emit(IndicatordataFailureState(e.toString()));
    }
  }

  IndicatordataBloc() : super(IndicatordataInitial()) {
    on<IndicatordataGetDataEvent>(_mapIndicatordataEventToState);
  }
}
