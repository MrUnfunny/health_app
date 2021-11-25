part of 'homescreen_bloc.dart';

abstract class HomescreenState extends Equatable {
  final HomeScreenData homeScreenData;
  const HomescreenState(this.homeScreenData);

  @override
  List<Object> get props => [homeScreenData];
}

class HomescreenInitialState extends HomescreenState {
  const HomescreenInitialState(HomeScreenData homeScreenData)
      : super(homeScreenData);
}

class HomescreenGetDataStartedState extends HomescreenState {
  const HomescreenGetDataStartedState(HomeScreenData homeScreenData)
      : super(homeScreenData);
}

class HomeScreenGetDataSuccessState extends HomescreenState {
  const HomeScreenGetDataSuccessState(HomeScreenData homeScreenData)
      : super(homeScreenData);
}

class HomeScreenGetDataFailureState extends HomescreenState {
  final String errorMsg;

  const HomeScreenGetDataFailureState(
      this.errorMsg, HomeScreenData homeScreenData)
      : super(homeScreenData);
}
