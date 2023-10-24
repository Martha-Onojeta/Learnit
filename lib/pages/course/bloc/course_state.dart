part of 'course_bloc.dart';

class CourseState {
  const CourseState({this.courseItem});
  final CourseItem? courseItem;

  CourseState copyWith({CourseItem? courseItem}) {
    return CourseState(courseItem: courseItem ?? this.courseItem);
  }
}
