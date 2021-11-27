import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/home_screen_data.dart';
import '../../repository/firestore_repository.dart';
import '../firestore/firestore_bloc.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  final FirestoreBloc firestoreBloc;
  late StreamSubscription firestoreStreamSubscription;

  final FirestoreRepository _firestoreRepository = FirestoreRepository();

  void firestoreListen(FirestoreState firestoreState) {
    if (firestoreState is FirestoreSuccessState) {
      add(HomescreenGetDataEvent());
    }
  }

  Future<void> _mapHomeScreenGetDataSuccessStateToState(
      HomescreenGetDataEvent event, Emitter<HomescreenState> emit) async {
    try {
      emit(HomescreenGetDataStartedState(state.homeScreenData));
      var homeScreenData = await _firestoreRepository.getHomeScreenData();

      emit(HomeScreenGetDataSuccessState(homeScreenData));
    } catch (e) {
      emit(HomeScreenGetDataFailureState(e.toString(), state.homeScreenData));
    }
  }

  HomescreenBloc(this.firestoreBloc)
      : super(HomescreenInitialState(HomeScreenData.zero())) {
    on<HomescreenGetDataEvent>(_mapHomeScreenGetDataSuccessStateToState);

    firestoreStreamSubscription = firestoreBloc.stream.listen(firestoreListen);
  }

  @override
  Future<void> close() {
    firestoreStreamSubscription.cancel();
    return super.close();
  }
}
