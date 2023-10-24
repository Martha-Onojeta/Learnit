import 'package:learning_app/common/entities/course.dart';
import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/common/utils/http_utils.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');
    print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseDetailResponseEntity> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('api/courseDetail', queryParameter: params?.toJson());
    //print(response.toString());
    return CourseDetailResponseEntity.fromJson(response);
  }

  //for course payment

  static Future<BaseResponseEntity> coursePay(
      {CourseRequestEntity? params}) async {
    var response =
        await HttpUtil().post('api/checkout', queryParameter: params?.toJson());

    return BaseResponseEntity.fromJson(response);
  }
}
