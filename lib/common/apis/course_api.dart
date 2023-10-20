import 'package:learning_app/common/entities/course.dart';
import 'package:learning_app/common/utils/http_utils.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courselist() async {
    var response = await HttpUtil().post('api/courseList');
    print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }
}
