part of 'home_page_bloc.dart';

class HomePageState {
  HomePageState({this.courseItem = const <CourseItem>[], this.index = 0});
  final int index;
  final List<CourseItem> courseItem;

  HomePageState copyWith({int? index, List<CourseItem>? courseItem}) {
    return HomePageState(
        courseItem: courseItem ?? this.courseItem, index: index ?? this.index);
  }
}
