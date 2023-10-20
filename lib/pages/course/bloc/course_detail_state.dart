part of 'course_detail_bloc.dart';

class CourseDetailState {
  const CourseDetailState({this.courseItem});
  final CourseItem? courseItem;

  CourseDetailState copyWith({CourseItem? courseItem}) {
    return CourseDetailState(courseItem: courseItem ?? this.courseItem);
  }
}
