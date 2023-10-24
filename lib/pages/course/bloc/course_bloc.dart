import 'package:bloc/bloc.dart';
import 'package:learning_app/common/entities/course.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(const CourseState()) {
    on<TriggerCourse>(_triggerCourse);
  }

  void _triggerCourse(TriggerCourse event, Emitter<CourseState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
