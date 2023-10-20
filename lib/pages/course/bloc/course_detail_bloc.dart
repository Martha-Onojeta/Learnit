import 'package:bloc/bloc.dart';
import 'package:learning_app/common/entities/course.dart';
import 'package:meta/meta.dart';

part 'course_detail_event.dart';
part 'course_detail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(const CourseDetailState()) {
    on<TriggerCourseDetail>(_triggerCourseDetail);
  }

  void _triggerCourseDetail(
      TriggerCourseDetail event, Emitter<CourseDetailState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
