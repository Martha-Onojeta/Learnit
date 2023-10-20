part of 'course_detail_bloc.dart';

abstract class CourseDetailEvent {
  const CourseDetailEvent();
}

class TriggerCourseDetail extends CourseDetailEvent {
  const TriggerCourseDetail(this.courseItem) : super();
  final CourseItem courseItem;
}
