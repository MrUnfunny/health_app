import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/userdata.dart';
import '../../repository/firestore_repository.dart';

part 'userdata_event.dart';
part 'userdata_state.dart';

class UserdataBloc extends Bloc<UserdataEvent, UserdataState> {
  final _firestoreRepository = FirestoreRepository();

  Future<void> _mapUserdataSubmitEventToState(
      UserdataSubmitEvent event, Emitter<UserdataState> emit) async {
    try {
      emit(UserdataSubmissionStartedState());
      await _firestoreRepository.submitUserData(event.userData);
      emit(UserdataSubmittedState());
    } catch (e) {
      emit(UserdataSubmissionFailureState(e.toString()));
    }
  }

  UserdataBloc() : super(UserdataUnknownState()) {
    on<UserdataSubmitEvent>(_mapUserdataSubmitEventToState);
  }
}
