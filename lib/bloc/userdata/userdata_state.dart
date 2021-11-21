part of 'userdata_bloc.dart';

abstract class UserdataState extends Equatable {
  const UserdataState();

  @override
  List<Object> get props => [];
}

class UserdataUnknownState extends UserdataState {}

class UserdataSubmissionStartedState extends UserdataState {}

class UserdataSubmittedState extends UserdataState {}

class UserdataSubmissionFailureState extends UserdataState {
  final String errorMsg;

  const UserdataSubmissionFailureState(this.errorMsg);
}
