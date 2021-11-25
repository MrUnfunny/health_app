part of 'homescreen_bloc.dart';

abstract class HomescreenEvent extends Equatable {
  const HomescreenEvent();

  @override
  List<Object> get props => [];
}

class HomescreenGetDataEvent extends HomescreenEvent {}
