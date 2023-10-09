part of 'home_page_bloc.dart';

class HomePageEvent {
  HomePageEvent();
}

class HomePageDots extends HomePageEvent {
  int index;
  HomePageDots(this.index);
}
