import 'package:bloc/bloc.dart';
import 'package:learning_app/common/entities/course.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<HomePageDots>(_homePageDots);
    on<HomePageCourseItem>(_homePageCourseItem);
  }
  void _homePageDots(HomePageDots event, Emitter<HomePageState> emit) {
    emit(state.copyWith(index: event.index));
  }

  void _homePageCourseItem(
      HomePageCourseItem event, Emitter<HomePageState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
