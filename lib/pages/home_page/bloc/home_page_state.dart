part of 'home_page_bloc.dart';

class HomePageState {
  HomePageState({this.index = 0});
  final int index;

  HomePageState copyWith({int? index}) {
    return HomePageState(index: index ?? this.index);
  }
}
