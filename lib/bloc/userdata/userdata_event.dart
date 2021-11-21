part of 'userdata_bloc.dart';

abstract class UserdataEvent extends Equatable {
  const UserdataEvent();

  @override
  List<Object> get props => [];
}

class UserdataSubmitEvent extends UserdataEvent {
  final UserData userData;

  const UserdataSubmitEvent(this.userData);
}
